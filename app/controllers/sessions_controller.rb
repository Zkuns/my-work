class SessionsController < ApplicationController
  skip_before_action :must_login_in, only: [:new, :create]
  skip_before_action :must_admin
  before_action :must_not_login_in, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      @user.update_attribute(:remember_token, SecureRandom.urlsafe_base64)
      session[:id] = @user.id
      cookies[:remember_token] = @user.remember_token
      @com = @user.company
      if @user.admin?
        @user = User.new(username: user_params[:username])
        flash.now[:danger] = '身份错误'
        render :new
      else
        redirect_to  company_items_path(@com)
      end
    else
      @user = User.new(username: user_params[:username])
      flash.now[:danger] = '账号密码错误，请联系管理员'
      render :new
    end
  end

  def admin_new
    @user = User.new
  end

  def admin_create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      @user.update_attribute(:remember_token, SecureRandom.urlsafe_base64)
      session[:id] = @user.id
      cookies[:remember_token] = @user.remember_token
      @com = @user.company
      if @user.admin?
        redirect_to companies_path
      else
        @user = User.new(username: user_params[:username])
        flash.now[:danger] = '不是管理员'
        render :new
      end
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
    redirect_to company_items_path(current_user.company) if current_user
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
