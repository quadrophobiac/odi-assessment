require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount, date, credit)
    # e.g. String "stephen", amount as float, and date in someformat

    # # psuedocode for now
    # payeeId = Customer.where(name: payee).find(_id)
    # payerId = Customer.where(name: payee).find(_id)
    # Transaction.create(amount: amount, date: date, CrDr: credit, [customer_ids])

  end

  def getBalance(username)
    pseudocode

    # usrId = Customer.where(name: payee).find(_id)
    # allTransactions = Transactions.usrId
    # iterate over the Cr and Dr of each

  end

  def getBalance(username, date)

    

  end
end