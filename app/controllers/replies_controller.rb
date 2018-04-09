# Description : Replies controller
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
#     Luis Tan 3/22/18 - Added Report Feature

# File created on: 2/21/18
# Developer: Ivan Balingit
# Client: UP Diliman Students
# IskoExchange is a platform for UP students to ask questions and share insights related to UP

class RepliesController < ApplicationController
  before_action :logged_in_user
  
  # POST /replies
  def create
    @answer = Answer.find(params[:reply][:answer_id])
    @reply = Reply.new(reply_params)
    if @answer.replies << @reply
      @notif = Notification.new(by_id: current_user.id, to_id: @answer.user_id, question_id: @answer.question, action: "has replied to your Answer.")
      @answer.question.notifications << @notif
      redirect_to @answer.question
    else
      redirect_to @answer.question
    end
  end
  
  # GET /replies/:id/edit
  def edit
    @reply = Reply.find(params[:id])
    @answer = @reply.answer
    @question = @answer.question
  end
  
  # PATCH? /replies/:id/edit
  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
        redirect_to @reply.answer.question
    else
        render 'edit'
    end
  end
  
  # DELETE /replies/:id
  def destroy
    @reply = Reply.find(params[:id])
    if @reply.destroy
      redirect_to @reply.answer.question
    else 
      redirect_to @reply.answer.question # Include message
    end  
  end

  # 3/22/18
  # Added Report Feature
  def report
    @question = Question.find(params[:question_id])
    if @question
      if @question.user_id == current_user.id
        x = Reply.find(params[:reply_id])
        @notif = Notification.new(by_id: current_user.id, to_id: x.user_id, question_id: @question, action: "has reported your Reply.")
        @question.notifications << @notif
        x.reported = !(x.reported) 
        x.save
      end
    end
    redirect_to @question 
  end
  
  # For the parameters when finding the data
  private
    def reply_params
      params.require(:reply).permit(:content, :answer_id, :user_id)
    end
end
