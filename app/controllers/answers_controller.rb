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
    Luis Tan 2/14/18 - Initial Source Code with Create and New method
    Luis Tan 2/19/18 - Finished the CRUD functionality for Answer
    Ivan Balingit 3/7/18 - Redirect with errors on invalid answer
    
     File created on: 2/14/18
     Developer: Luis Tan
     Client: UP Diliman Students
     IskoExchange is a platform for UP students to ask questions and share insights related to UP
=end

class AnswersController < ApplicationController
  # 2/14/18
  # For the new view of Question
  def new
    @question = Question.new
  end
  # 2/14/18
  # For the create function of Answer
  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = Answer.new(answer_params)
    if @question.answers << @answer
      redirect_to @question
    else
      redirect_to @question, flash: { error: @answer.errors, content: @answer.content }
    end
  end
  # 2/19/18
  # For the destroy function of Answer
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])
    if @answer.destroy
      redirect_to @question
    else 
      redirect_to @question #CHANGE
    end
  end

  # 2/19/18
  # For the edit function of Answer
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])    
  end

  # 2/19/18
  # For the update function of Answer
  def update
    @question = Question.find(params[:answer][:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
        redirect_to @question
    else
        render 'edit'
    end
  end

  def report
    @question = Question.find(params[:question_id])
    if @question
      if @question.user_id == current_user.id
        x = @question.answers.find(params[:answer_id])
        x.reported = !(x.reported) 
        x.save
      end
    end
    redirect_to @question 
  end

  private
  # 2/14/18
  # For the parameters when finding the data
  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
