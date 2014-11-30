class UsersController < ApplicationController
  
  def index
    @users = User.all  
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '添加成功'
      redirect_to users_path
    else
      flash.now[:danger] = '添加失败'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '修改成功'
      redirect_to users_path
    else
      flash.now[:danger] = '修改失败,请重试'
      render :new
    end
  end

  def destroy
    User.destroy(User.find(params[:id])) if params[:id]
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :admin)
  end

end
