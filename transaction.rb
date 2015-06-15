class Transaction
  include Mongoid::Document
  field :amount, type: Float
  field :date, type: Date
  has_and_belongs_to_many :customer
end