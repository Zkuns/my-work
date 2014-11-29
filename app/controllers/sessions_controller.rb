class SessionsController < ApplicationController
  skip_before_action :must_login_in, only: [:new, :create]
  skip_before_action :must_admin, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      @user.update_attribute(:remember_token, SecureRandom.urlsafe_base64)
      session[:id] = @user.id
      cookies[:remember_token] = @user.remember_token
      redirect_to 
    else
      @user = User.new(username: user_params[:username])
      flash.now[:danger] = '账号密码错误，请联系管理员'
      render :new
    end
  end

  def destroy
    session[:id] = nil
    cookies[:remember_token] = nil
    redirect_to root_path
  end

  private

  def must_not_login_in
    redirect_to admin_root_path if current_admin
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
