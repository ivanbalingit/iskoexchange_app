=begin
    Description : Ruby file for answer
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
     Luis Tan 2/14/18 - Initial Source Code
     Ivan Balingit 2/21/18 - Add relation for replies
     Ivan Balingit 3/7/18 - Add validation for answer content and length
     Luis Tan 3/22/18 - Add relations with votes
     Ivan Balingit 4/12/18 - Add images

     File created on: 2/14/18
     Developer: Luis Tan, Ivan Balingit
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :question

    has_many   :votes, dependent: :delete_all
    has_many   :replies, dependent: :delete_all
    validates  :content, presence: true, length: { minimum: 4 }

    has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
