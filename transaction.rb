class Transaction
  include Mongoid::Document
  field :amount, type: Float
  field :date, type: Date
  belongs_to :customer
end