class User < ApplicationRecord
  include Clearance::User
  has_secure_token :api_token

  before_create :generate_api_token

  has_many :posts

  def generate_api_token
    self.api_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(api_token: random_token)
    end
  end

  def destroy_api_token
    self.update_attribute(:api_token, nil)
  end
end
