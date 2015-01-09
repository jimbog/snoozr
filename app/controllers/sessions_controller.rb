class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:login][:username])
    # session starts when user logs in w/ username & password
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

  def destroy #logging out
    session.delete(:user_id)
    redirect_to login_path
  end
end
