class QuestionsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new   
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def create   
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end
  
  private
    def question_params
      params.require(:question).permit(:title, :content, :user_id)
    end
end  