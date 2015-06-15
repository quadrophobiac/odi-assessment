class Customer

  attr_accessor :balance

  include Mongoid::Document
  has_and_belongs_to_many :transactions
  field :name, type: String
  field :password, type: String

  def getBalance()
    gross = self.transactions.distinct(:amount) # all transactions
    cr = self.transactions.where(recipient: self.name).distinct(:amount) # any transactions to 'self'
    if cr.count > gross.count # makes assumption that more entries is instructive, might not be the case
      self.balance = cr - gross
    end
    self.balance = ;

  end

end