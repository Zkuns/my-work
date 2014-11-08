module SessionsHelper

  def sign_in(user)
    token = User.new_token
    user.update_attribute(remember_token: token)
    cookies[:remember_token] = {value: token, expires: 1.day.from_now}
  end

end
