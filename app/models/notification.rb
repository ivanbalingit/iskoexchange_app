class Notification < ApplicationRecord
  belongs_to :by, :class_name => 'User' 
  belongs_to :to, :class_name => 'User' 
  belongs_to :question
end
