module ApplicationHelper
  def current_user
    User.where(email: session[:email]).first
  end
end
