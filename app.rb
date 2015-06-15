# /usr/bin/env ruby

require 'json'
require 'moped'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)
require './customer'
require './transaction'
require './transaction_controller'

# register loop

# pseudocode
# name = prompt ("your name please")
# pwd = prompt ("enter a password please")
# name = new Customer(name: name, password: pwd)
# name.save()

# login loop

# create some accounts
# if not exists ...
stephen = Customer.new(name: "stephen", password: "password")
supervalu = Customer.new(name: "supervalu", password: "password")
mary = Customer.new(name: "mary", password: "password")
stephen.save()
supervalu.save()
mary.save()

Banking = TransactionController.new()

# make some payments

Banking.transfer(supervalu, stephen, 480.00, Date.new(2015, 04, 30))
Banking.transfer(stephen, supervalu, 55.00, Date.new(2015, 04, 30))
Banking.transfer(mary, stephen, 45.00, Date.new(2015, 05, 03))
Banking.transfer(mary, stephen, 5.00, Date.new(2015, 05, 6))
Banking.transfer(stephen, mary, 480.00, Date.new(2015, 05, 9))
Banking.transfer(stephen, mary, 420.00, Date.new(2015, 04, 9))
Banking.transfer(mary, supervalu, 46.00, Date.new(2015, 05, 2))
Banking.transfer(stephen, supervalu, 205.00, Date.new(2015, 05, 31))
Banking.transfer(supervalu, stephen, 15.00, Date.new(2015, 06, 03))
Banking.transfer(stephen, stephen, 25.00, Date.new(2015, 06, 6))
Banking.transfer(stephen, stephen, 480.00, Date.new(2015, 06, 8))
Banking.transfer(stephen, mary, 420.00, Date.new(2015, 06, 9))
Banking.transfer(mary, supervalu, 46.00, Date.new(2015, 06, 2))

puts("Mary's balance is #{mary.getBalance}")
puts("Stephen's balance is #{stephen.getBalance}")
puts("Supervalu balance is #{supervalu.getBalance}")