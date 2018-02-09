=begin
    Description: Controller functions for login
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

class SessionsController < ApplicationController
  # GET /login
  def new
  end
  
  # POST /login
  def create
  	user = User.find_by(email: params[:session][:email])
  	if !user
  	  # If the email does not exist in the database
  	  @notice = "Email does not exist."
  	  render action: 'new'
  	elsif user.authenticate(params[:session][:password])
  	  # If the email exists and password is correct
  		session[:email] = user.email
  		redirect_to root_url
  	else
  	  # If the email exists but the password is incorrect
  	  @email = user.email
  	  @notice = "Invalid password."
  	  render action: 'new'
  	end
  end
  
  # DELETE /logout
  def destroy
    # Remove value of session[:email] and redirect to homepage
  	session[:email] = nil
  	redirect_to '/'
  end
end
