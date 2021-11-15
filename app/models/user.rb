class User < ActiveRecord::Base

  # gives our User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 2 }


  def  self.authenticate_with_credentials(email , password)
    email = email.strip.downcase
    user = User.find_by_email(email)&.authenticate(password)
  end

end