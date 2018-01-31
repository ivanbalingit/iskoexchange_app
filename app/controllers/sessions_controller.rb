class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if !user
  	  # If the email does not exist in the database
  	  @notice = "Email does not exist."
  	  render action: 'new'
  	elsif user.authenticate(params[:session][:password])
  	  # If the email exists and password is correct
  		session[:email] = user.email
  		redirect_to root_url
  	else
  	  # If the email exists but the password is incorrect
  	  @email = user.email
  	  @notice = "Invalid password."
  	  render action: 'new'
  	end
  end

  def destroy
  	session[:email] = nil
  	redirect_to '/'
  end
end
