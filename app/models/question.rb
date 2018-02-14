class Question < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true, length: { minimum: 15 }
end
