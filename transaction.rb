class Transaction

  include Mongoid::Document
  field :amount, type: Float
  field :date, type: Date
  field :recipient, type: String
  field :CrDr, type: Boolean
  has_and_belongs_to_many :customers
end