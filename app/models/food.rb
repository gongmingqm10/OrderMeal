class Food
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :price, type: Float
  field :describe, type: String
  field :picture, type: String

  belongs_to :owner, class_name: 'User'


end