class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path, notice: "Logged in"
    else
      redirect_to login_path, alert: "Incorrect username or password"
    end
  end

  def destroy
  end
end
