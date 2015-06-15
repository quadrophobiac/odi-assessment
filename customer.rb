class Customer

  include Mongoid::Document
  has_many :transactions
  field :name, type: String
  field :password, type: String

end