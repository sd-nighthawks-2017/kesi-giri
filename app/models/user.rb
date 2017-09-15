require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :password_present

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

  private
  def password_present
    errors.add(:password, "cannot be blank") if self.password == ""
  end
end
