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
     Ivan Balingit 2/17/18 - Add action for search questions
     Luis Tan 2/19/18 - Finished the CRUD functionalities for Question
     Ivan Balingit 2/21/18 - Modify show action for replies
     Ivan Balingit 3/22/18 - Whitelist :tag_list on parameters
     Ivan Balingit 3/22/18 - Redirect to tags#show if term contains "tag:"
     Ivan Balingit 4/12/18 - Whitelist :image on parameters
     Ivan Balingit 4/12/18 - Sort questions by newest or trending
     Ivan Balingit 4/13/18 - Add pagination

     File created on: 1/26/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  
  # 2/2/18
  # For the index view of Question
  def index
    @questions = Question.all
    if    params[:s] == "n"
      @questions = @questions.sort_by(&:created_at).reverse.page(params[:page])
    elsif params[:s] == "t"
      @questions = @questions.sort_by(&:interaction_count).reverse.page(params[:page])
    else
      @questions = @questions.page(params[:page])
    end
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
    @answer = Answer.new
    @reply = Reply.new
    if params[:notif_id]
      if Notification.find_by(id: params[:notif_id]) 
        Notification.find_by(id: params[:notif_id]).update(read: true)
      end
    end
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
  
  # 2/19/18
  # For the destroy function of Question
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to root_path
    else 
      redirect to :back #CHANGE
    end    
  end
  # 2/18/18
  # GET /search
  def search
    @term = params[:q]
    if @term.split(':')[0] == "tag"
      @tag = @term.split(':')[1]
      @questions = Question.tagged_with(@tag)
      redirect_to "/tags/#{@tag}"
    else
      @questions = Question.where("lower(title) LIKE lower(?)", "%#{@term}%")
    end 
  end

  # 2/19/18
  # For the edit function of Question
  def edit
    @question = Question.find(params[:id])
  end

  # 2/19/18
  # For the update function of Question
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
        redirect_to @question
    else
        render 'edit'
    end
  end
  
  private
    # 2/2/18
    # For the parameters when finding the data
    def question_params
      params.require(:question).permit(:title, :content, :user_id, :tag_list, :image)
    end
end  
