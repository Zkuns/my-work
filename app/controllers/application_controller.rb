class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
  def activities_url
    Settings.get_activities_url + '?token=' + Settings.token
  end

  def applies_url activity_id
    #http://www.geekpark.net/api/v1/applies/#{activity_id}?token=4cv4042559479932
    Settings.get_applies_url + '/' + activity_id + '?token=' + Settings.token
  end

  def sign_in(user)
    token = User.new_token
    current_user = user
    user.update_attribute(:remember_token, token)
    cookies[:remember_token] = {value: token, expires: 1.day.from_now}
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:rememeber_token])
  end
end
