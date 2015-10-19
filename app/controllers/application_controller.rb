class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

private
  def check_logged_in
    redirect_to login_path, notice: "You must log in first" unless session[:user_id]
  end
