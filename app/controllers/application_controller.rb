class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user

  def logged_in?
    !session[:email].nil?
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/login'
    end
  end

  def current_user
    User.where(email: session[:email]).first
  end
end
