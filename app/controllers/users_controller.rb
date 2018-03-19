=begin
    Description: Controller functions for Users model
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
     Ivan Balingit 2/14/18 - Add show method
     Ivan Balingit 2/22/18 - Add edit and update methods

     File created on: 1/26/18
     Developer: 
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class UsersController < ApplicationController
  # GET /signup
  def new
    @user = User.new
  end
  
  # POST /signup
  def create
    @user = User.create(user_params)
    @user.education_degree, @user.education_school = "", ""
    @user.employment_position, @user.employment_company = "", ""    
    if @user.save
      redirect_to root_url
    else
      render action: 'new'
    end
  end
  
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
  
  # GET /users/:id/edit
  def edit
    if !current_user
      redirect_to login_path
    elsif params[:id].to_i != current_user.id
      redirect_to current_user
    else
      @user = current_user
    end
  end
  
  # PATCH /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to @user
    else
        render 'edit'
    end
  end
  
  private
    def user_params
      # Parameters required by the user: email, display_name, password, password_confirmation
      params.require(:user).permit(:email, :display_name, :password, :password_confirmation, :description, :education_degree, :education_school, :show_education, :employment_position, :employment_company, :show_employment)
    end
end
