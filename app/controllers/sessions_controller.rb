class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
    if check? @user
      sign_in @user
      redirect_to root_path
    else
      flash.now[:notice] = 'invalid user'
      render :new
    end
  end

private

  def check?(user)
    true_user = User.find_by(username: user.username)
    true_user && true_user.authenticate(user.password)
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
