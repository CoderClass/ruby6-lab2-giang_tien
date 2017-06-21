class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user

  def signed_in?
    current_user.is_a? User
  end

  helper_method :signed_in?


end
