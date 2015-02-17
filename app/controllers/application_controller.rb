class ApplicationController < ActionController::Base
  helper_method :current_user, :ensure_user_authenticated!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def ensure_user_authenticated!
    if current_user.nil?
      redirect_to :new_user_session_path
    end
  end
end
