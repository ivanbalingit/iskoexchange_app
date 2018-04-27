# Description : Migration file for the reply model
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
#     Luis Tan 3/22/18 - Initial Source Code and content.

# File created on: 3/22/18
# Developer: Luis Tan
# Client: UP Diliman Students
# IskoExchange is a platform for UP students to ask questions and share insights related to UP


class ChangeDefaultValuesOfVotes < ActiveRecord::Migration[5.1]
  def change
    change_column_default :answers, :upvote, from: nil, default: 0
    change_column_default :answers, :downvote, from: nil, default: 0
  end
end
