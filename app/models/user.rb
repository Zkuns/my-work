class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false}

  def authenticate password
    password == self.password
  end
 
  def self.new_token
    SecureRandom.urlsafe_base64
  end
end
