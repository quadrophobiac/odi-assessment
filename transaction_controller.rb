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

  def getBalance(user, year, month, day)
    # aim of this is what is the balance on a given date
    chosenDate = Date.new(year, month, day)
    #establish date span and create a 'view' from it for purposes of iterating over
    user.transactions.between(date: (Transaction.first.date..chosenDate))
    # transaction.first catches the first transaction, not the most chronologically distant
    # Edge case fail can arise due to time feature being accurate to the hour of the ranges compared, and all
    # time entries having a time of 00:00

    # search the above range for the user._id matching within customer_ids array
    # this may not be necessary with a REPL, but if so consult here http://docs.mongodb.org/manual/tutorial/query-documents/#match-a-specific-element-of-an-array

    # the algorithm needs to have an array where the sequence in the array matches the sequence of dates
    # ideally return the above queries as a temporary collection and then use Criteria#each method to iterate

  end
end