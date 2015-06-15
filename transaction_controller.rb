require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount)
    # e.g. Customer Objects payer & payee,
    # amount as float,
    # and date in as date object, date must be in YYYY, MM DD
    exchange  = Transaction.new(amount: amount, recipient: payee.name)
    exchange.customers.push(payer)
    if payer._id != payee._id then
      print("noting that transfer #{exchange._id} was noted as going from #{payer.name}")
      exchange.customers.push(payee)
    end
    exchange.save()
  end

  def getBalance(username, date)
    # aim of this is what is the balance on a given date
  end
end