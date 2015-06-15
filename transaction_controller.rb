require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount)
    # e.g. String "payee/payer", amount as float, and date in someformat, date must be in YYYY, MM DD
    # alternative - pass an object as reference

    # date = Date.new(date)

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