class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def require_teacher
    redirect_to dashboard_path unless current_user.teacher?
  end
end
