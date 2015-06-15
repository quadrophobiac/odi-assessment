require './customer'
require './transaction'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)

class TransactionController

  def transfer(payer, payee, amount, credit)
    # e.g. String "payee/payer", amount as float, and date in someformat, date must be in YYYY, MM DD
    # alternative - pass an object as reference

    # date = Date.new(date)

    # # psuedocode for now
    # payeeId = Customer.where(name: payee).distinct(:_id).as_json
    # payeeId = payeeId[0]["$oid"]
    # payerId = Customer.where(name: payer).distinct(:_id).as_json
    # payerId = payerId[0]["$oid"]
    # Transaction.create(amount: amount, date: date, CrDr: credit, [customer_ids])

    # Transaction.create(amount: amount, [customer_id: payer._id, payee._id ])
    payer.transactions.create(amount: amount, CrDr: credit)
    # this method creates a transaction instance anew everytime, ergo the two way association isn't easy


  end

  def getBalance(username)
    # pseudocode

    # usrId = Customer.where(name: payee).find(_id)
    # allTransactions = Transactions.usrId
    # iterate over array, calculating the Cr and Dr of each
    # i.e. if (CrDr): sum += Transaction.amount() else: sum -= Transaction.amount(0)

  end

  def getBalance(username, date)
    # aim of this is what is the balance on a given date


  end
end