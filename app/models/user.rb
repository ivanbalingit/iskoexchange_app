class User < ApplicationRecord
  has_secure_password
  validates :email, :display_name, presence: true
end
