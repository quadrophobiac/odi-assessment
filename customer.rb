class Customer
  attr_accessor :balance, :auth

  include Mongoid::Document
  has_and_belongs_to_many :transactions
  field :name, type: String
  field :password, type: String

  def getBalance()
    gross = self.transactions.distinct(:amount) # all transactions
    cr = self.transactions.where(recipient: self.name).distinct(:amount) # any transactions to 'self'
    # make above more compact with self.transactions.between(date: (Transaction.first.date..Date.today())).sum(:amount)
    # TY very much aggregators http://mongoid.org/en/mongoid/docs/querying.html#aggregations
    dr = gross - cr
    crBal = cr.inject(:+) # enumerate the sum of vals, or use sum as commented above
    drBal = dr.inject(:+) # enumerate the sum of vals
    if drBal > crBal
      self.balance = (drBal - crBal)*-1
    else
      self.balance = crBal - drBal
    end
  end

  def auth()
    # this would avail of some middleware for security purposes and return the Customer objects accessible
    # aspects thereafter
  end
end