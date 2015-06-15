require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount, date, credit)
    # e.g. String "stephen", amount as float, and date in someformat, date must be in YYYY, MM DD

    date = Date.new(date)

    # # psuedocode for now
    # payeeId = Customer.where(name: payee).find(_id)
    # payerId = Customer.where(name: payer).find(_id)
    # Transaction.create(amount: amount, date: date, CrDr: credit, [customer_ids])

  end

  def getBalance(username)
    pseudocode

    # usrId = Customer.where(name: payee).find(_id)
    # allTransactions = Transactions.usrId
    # iterate over array, calculating the Cr and Dr of each
    # i.e. if (CrDr): sum += Transaction.amount() else: sum -= Transaction.amount(0)

  end

  def getBalance(username, date)
    # aim of this is what is the balance on a given date

  end
end