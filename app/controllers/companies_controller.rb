class CompaniesController < ApplicationController
  
  def index
    @coms = Company.all
  end

  def new
    @com = Company.new
  end

  def create
    @com = Company.new(com_params)
    if @com.save
      flash[:success] = '添加成功'
      redirect_to companies_path
    else
      flash.now[:danger] = '添加失败'
      render :new
    end
  end

  def edit
    @com = Company.find(params[:id])
  end
  
  def update
    @com = Company.find(params[:id])
    if @com.update(com_params)
      flash[:success] = '修改成功'
      redirect_to companies_path
    else
      flash.now[:danger] = '修改失败,请重试'
      render :edit
    end
  end

  def destroy
    Company.destroy(Company.find(params[:id])) if params[:id]
    redirect_to companies_path
  end

  private

  def com_params
    params.require(:company).permit(:name)
  end
end
