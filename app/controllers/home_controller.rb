class HomeController < ApplicationController
  def index
    @questions = Question.order("created_at DESC").first(10)
  end
end
