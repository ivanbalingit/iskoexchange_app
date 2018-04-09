#begin
#    Description: Coffee script for answers controller
#    Copyright (C) 2018 Luis Tan
#
#    This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2015-2016
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see https://www.gnu.org/licenses/.
#    
#    **CHANGELOG**
#    Luis Tan 3/22/18 - Initial Source Code and Added all the Methods
#    Luis Tan 4/9/18 - Remove Downvote
#
#    File created on: 3/22/18
#     Developer: Luis Tan
#     Client: UP Diliman Students
#    IskoExchange is a platform for UP students to ask questions and share insights related to UP
#=end

class VotesController < ApplicationController
    before_action :logged_in_user

    #For the upvote feature for the Answer
    def upvote
        @vote = Vote.find_by(answer_id: params[:answer_id], user_id: current_user.id)
        print("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEET")
        print(@vote)
        print("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEET")
        
        if @vote == nil
            @vote = Vote.new(user_id: current_user.id,answer_id: params[:answer_id],value: 0)
        end
        if @vote.value != 1
            @vote.value = 1
            @notif = Notification.new(by_id: current_user.id, to_id: @vote.answer.user, question_id: @question, action: "has upvoted your Answer.")
            @question.notifications << @notif
        else
            @vote.value = 0
        end
        @vote.save
        print("WAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT")
        print(@vote.answer.user.display_name)
        print("WAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT")
        redirect_back fallback_location: Question.find(Answer.find(params[:id]).question.id)
    end 

    private
    # 2/14/18
    # For the parameters when finding the data
    def vote_params
      params.require(:vote).permit(:answer_id,:user_id,:value)
    end
end
