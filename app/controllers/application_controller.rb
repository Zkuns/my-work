class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :must_login_in, :must_admin

  protected

  def current_user
    from_session || from_cookies
  end
  
  def must_login_in
    redirect_to root_path unless current_user
  end

  def must_admin
    redirect_to root_path unless current_user.admin
  end

  private

  def from_session
    User.find(session[:id]) if session[:id] && User.exists?(session[:id])
  end

  def from_cookies
    User.find(cookies[:remember_token]) if cookies[:remember_token].present?
  end
end
