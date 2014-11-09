module AppliesHelper

  def activities_url
    Settings.get_activities_url + '?token=' + Settings.token
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:rememeber_token])
  end
end
