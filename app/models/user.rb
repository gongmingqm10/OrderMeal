class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :password_hash, type: String
  field :password_salt, type: String
  field :role, type: String
  field :email, type: String
  field :phone, type: String

  attr_accessor :password

  validates_presence_of( :username, :password)

  embeds_one :shop
  has_many :foods
  before_save :encrypt_password

  class << self
    def authenticate (username, password)
      user = find_by(username: username)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      end
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end