class CompaniesController < ApplicationController
  
  def creategame
    com = Company.find(params[:id])
    games = com.coo_games || ''
    if games == ''
      games = games << com_params[:coo_games]
    else
      games = games << ',' + com_params[:coo_games]
    end
    com_params['coo_games'] = games
    com.update(coo_games: games)
    redirect_to companies_path
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

  def games
    @com = Company.find(params[:id])
    @games = @com.coo_games || ''
  end

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

  def destroy
    Company.destroy(Company.find(params[:id])) if params[:id]
    redirect_to companies_path
  end

  private

  def com_params
    params.require(:company).permit(:name,:coo_games)
  end
end
