# Description : Ruby file for the reply model
# Copyright (C) 2018 Ivan Balingit

# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see https://www.gnu.org/licenses/.

# *CHANGELOG*
#     Ivan Balingit 2/21/18 - Initial Source Code and content.

# File created on: 2/21/18
# Developer: Ivan Balingit
# Client: UP Diliman Students
# IskoExchange is a platform for UP students to ask questions and share insights related to UP

class Reply < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates  :content, presence: true, length: { minimum: 4 }
end
