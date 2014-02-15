class Shop
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :address, type: String
  embedded_in :user

end