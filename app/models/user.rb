class User < ApplicationRecord
  include Clearance::User
  has_secure_token :api_token

  has_many :posts
end
