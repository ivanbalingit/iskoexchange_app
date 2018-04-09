=begin
    Description : Ruby file for answers controller
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
    Luis Tan 4/9/18 - Initial Source Code and All

     File created on: 4/9/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end
class NotificationsController < ApplicationController
    def index
        @notifications = Notification.where(to_id: current_user.id)
    end

    def readAll
        @notifications = Notification.all
        @notifications.each do |notif|
            notif.read = true
            notif.save
        end
        redirect_to notifications_path
    end
end
