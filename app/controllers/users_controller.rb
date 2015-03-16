class UsersController < ApplicationController
  
  def index
    @com = Company.find(params[:company_id])
    @users = @com.users
  end
  
  def new
    @com = Company.find(params[:company_id])
    @user = User.new
  end
  
  def create
    @com = Company.find(params[:company_id])
    @user = @com.users.new(user_params)
    unless @user.password == params[:user][:password_confirmation]
      flash.now[:danger] = '两次密码输入不一致'
      render :new
    end
    if @user.save
      flash[:success] = '添加成功'
      redirect_to company_users_path @com
    else
      flash.now[:danger] = '添加失败'
      render :new
    end
  end
  
  def edit
    @com = Company.find(params[:company_id])
    @user = User.find(params[:id])
  end
  
  def update
    @com = Company.find(params[:company_id])
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '修改成功'
      binding.pry
      redirect_to company_users_path
    else
      flash.now[:danger] = '修改失败,请重试'
      render :edit
    end
  end

  def destroy
    User.destroy(User.find(params[:id])) if params[:id]
    redirect_to company_users_path(current_user.company)
  end

  def change_coo
    user = User.find(params[:id])
    user.update(coo_type: (user.coo_type ? false : true))
    render nothing: true
  end

  private

  def user_params
    params.require(:user).permit(:company_name, :name, :coo_type, :username, :password, :admin, :cooperate_type)
  end

end