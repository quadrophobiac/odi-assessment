class Customer
  attr_accessor :balance

  include Mongoid::Document
  has_and_belongs_to_many :transactions
  field :name, type: String
  field :password, type: String

  def getBalance()
    gross = self.transactions.distinct(:amount) # all transactions
    cr = self.transactions.where(recipient: self.name).distinct(:amount) # any transactions to 'self'
    dr = gross - cr
    crBal = cr.inject(:+) # enumerate the sum of vals
    drBal = dr.inject(:+) # enumerate the sum of vals
    print("debit = #{drBal} and credit = #{crBal}")
    if drBal > crBal
      self.balance = (drBal - crBal)*-1
    else
      self.balance = crBal - drBal
    end
  end
end