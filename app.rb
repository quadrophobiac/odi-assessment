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
stephen.save()
supervalu.save()

# make some payments

# stephens payments
transfer()