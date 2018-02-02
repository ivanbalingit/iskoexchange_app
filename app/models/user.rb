class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_secure_password
  validates :email, :display_name, presence: true
  validates_email_format_of :email
end
