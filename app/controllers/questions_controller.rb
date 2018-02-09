=begin
    Description : Controller functions for 
    Copyright (C) 2018  Luis Tan

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

     **CHANGELOG**
     Luis Tan 2/2/18 - Inital Source Code and Generated all the methods. 
     Luis Tan 2/9/18 - Added License

     File created on: 1/26/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class QuestionsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  
  # 2/2/18
  # For the index view of Question
  def index
    @questions = Question.all
  end
  
  # 2/2/18
  # For the new view of Question
  def new
    @question = Question.new   
  end
  
  # 2/2/18
  # For the show view of Question
  def show
    @question = Question.find(params[:id])
  end
  
  # 2/2/18
  # For the create view of Question
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end
  
  private
    # 2/2/18
    # For the parameters when finding the data
    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end
end  
