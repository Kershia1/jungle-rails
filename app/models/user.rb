class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
     if user && user.authenticate(password)
      user
     else
      nil
     end
  end
end
