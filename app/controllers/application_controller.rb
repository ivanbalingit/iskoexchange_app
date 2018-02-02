class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user

  def logged_in?
    !session[:email].nil?
  end

  def current_user
    User.where(email: session[:email]).first
  end
end
