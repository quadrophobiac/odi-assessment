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

stephen = new Customer(name: "stephen", password: "password")
supervalu = new Customer(name: "supervalu", password: "password")
stephen.save()
supervalu.save()

# make some payments

# stephens payments
transfer()