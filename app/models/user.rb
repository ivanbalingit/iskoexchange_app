=begin
    Description : Ruby file for user
    Copyright (C) 2018 Ivan Balingit

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
     Ivan Balingit 1/31/18 - Create user model; add has_secure_password to user model; create users controller
     Ivan Balingit 2/1/18 - Add sign-up validation message
     Luis Tan 2/2/18 - Add Questions controller
     Luis Tan 2/14/18 - Add create answer
     Ivan Balingit 2/21/18 - Add relation for replies
     Ivan Balingit 3/20/18 - Add methods and validations for image
     Luis Tan 3/22/18 - Add relation for votes
     Luis Tan 4/9/18 - Add notfication-related features

     File created on: 1/31/18
     Developer: Ivan Balingit
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :by_notif, :class_name => 'Notification', :foreign_key => 'by_id'
  has_many :to_notif, :class_name => 'Notification', :foreign_key => 'to_id'


  has_secure_password
  validates :email, :display_name, presence: true
  validates_email_format_of :email

  has_attached_file :avatar, styles: { medium: "160x160#", thumb: "60x60#" }, default_url: "/man_shaggy.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
