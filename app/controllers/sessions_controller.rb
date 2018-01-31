class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user.authenticate(params[:session][:password])
  		session[:email] = user.email
  	end
  	redirect_to '/'
  end

  def destroy
  	session[:email] = nil
  	redirect_to '/'
  end
end
