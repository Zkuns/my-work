class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false}

  def self.new_token
    SecureRandom.urlsafe_base64
  end
end
