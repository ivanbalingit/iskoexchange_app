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

     File created on: 2/2/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, :content, presence: true, length: { minimum: 16 }
  acts_as_taggable_on :tags
end
