=begin
    Description: Helper methods for other controllers and views
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
     Ivan Balingit 2/2/18 - Initial Source Code and Generated all the methods. 
     Ivan Balingit 2/9/18 - Added License

     File created on: 1/26/18
     Developer: 
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user

  # Helper method to determine if someone is logged-in
  def logged_in?
    !session[:email].nil?
  end
  
  # Returns true if someone is logged-in, else redirects
  # to the login page
  def logged_in_user
    unless logged_in?
      redirect_to '/login'
    end
  end

  # Helper method that returns the currently logged-in
  # user as a User object
  def current_user
    User.where(email: session[:email]).first
  end
end
