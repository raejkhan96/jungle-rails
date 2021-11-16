class User < ActiveRecord::Base

  # gives our User model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, length: { minimum: 2 }

  before_save :lowercase_email

  def  self.authenticate_with_credentials(email , password)
    email = email.strip.downcase
    user = User.find_by_email(email)&.authenticate(password)
  end

  def lowercase_email
    self.email = self.email.downcase
  end

end