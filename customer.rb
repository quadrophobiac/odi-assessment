class Customer

  include Mongoid::Document
  require './transaction'
  has_and_belongs_to_many :transactions
  field :name, type: String
  field :password, type: String

  def transfer(payee, amount, date)

  end

  def getBalance()

  end

  def getBalance(date)

  end


end