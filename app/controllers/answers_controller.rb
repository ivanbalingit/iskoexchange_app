class AnswersController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    puts "SUCC 1"
    @answer = Answer.new(answer_params)
    if @question.answers << @answer
      puts "SUCC 2"
      redirect_to(@question)
    else
      render "questions/:user_id"
    end
  end

  private
  # 2/2/18
  # For the parameters when finding the data
  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
