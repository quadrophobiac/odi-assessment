# /usr/bin/env ruby

require 'json'
require 'moped'
require 'mongoid'
Mongoid::Config.load!('./mongoid.yml', :development)
require './customer'
require './transaction'

# register loop

# pseudocode
# name = prompt ("your name please")
# pwd = prompt ("enter a password please")
# name = new Customer(name: name, password: pwd)
# name.save()

# login loop

