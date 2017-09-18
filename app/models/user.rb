require 'bcrypt'
require 'json'
require 'net/http'

class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients
  include BCrypt
  include URI
  include JSON

  validates :email, presence: true, uniqueness: true
  

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(password)
    @password = Password.create(password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end

  def search(item) 
    # uri = URI("") 
     #api_response = Net::HTTP.get_response(uri)
    #JSON.parse(api_response)
  end

end
