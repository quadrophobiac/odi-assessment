require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount, date)
    # e.g. Customer Objects payer & payee,
    # amount as float,
    # and date in as date object, date must be in YYYY, MM DD
    exchange  = Transaction.new(amount: amount, recipient: payee.name, date: date)
    exchange.customers.push(payer)
    if payer._id != payee._id then
      exchange.customers.push(payee)
    end
    exchange.save()
  end

  def getBalance(username, year, month, day)
    # aim of this is what is the balance on a given date

    #establish date span
    Transaction.between(date: (Transaction.first.date..ChosenDate)).count
    # transaction.first catches the first transaction, not the most chronologically distant
  end
end