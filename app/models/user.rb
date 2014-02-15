class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password, type: String
  field :role, type: String
  field :email, type: String
  field :phone, type: String
  validates_presence_of( :username, :password)

  embeds_one :shop
  has_many :foods

  class << self
    def authenticate (username, password)
      user = find_by(username: username, password: password)
    end
  end

end