class Transaction

  include Mongoid::Document
  field :amount, type: Float
  field :date, type: Date
  field :CrDr, type: Boolean
  belongs_to :customer
end