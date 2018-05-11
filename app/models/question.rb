=begin
    Description : Ruby file for channel
    Copyright (C) 2018 Luis Tan

    This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see https://www.gnu.org/licenses/.

    *CHANGELOG*
     Luis Tan 2/2/18 - Add Questions controller
     Ivan Balingit 2/2/18 - Fix identations and newlines 
     Ivan Balingit 2/14/18 - Add question validation messages
     Luis Tan 2/14/18 - Add create answer
     Ivan Balingit 3/22/18 - Add necessary method for tags
     Ivan Balingit 4/12/18 - Add images
     Ivan Balingit 4/12/18 - Add interaction count method
     Ivan Balingit 4/13/18 - Add pagination

     File created on: 2/2/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :title, :content, presence: true, length: { minimum: 4 }
  acts_as_taggable_on :tags

  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  define_attribute_method :interaction_count

  paginates_per 5

  def interaction_count
    return self.answers.count
  end
end
