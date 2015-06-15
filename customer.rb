class Customer

  include Mongoid::Document
  has_and_belongs_to_many :transactions
  field :name, type: String
  field :password, type: String

end