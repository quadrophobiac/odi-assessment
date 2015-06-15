require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payee, amount, date)

  end

  def getBalance()

  end

  def getBalance(date)

  end
end