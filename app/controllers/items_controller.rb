class ItemsController < ApplicationController
  skip_before_action :must_admin, only: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      flash[:success] = '添加成功'
      redirect_to items_path
    else
      flash.now[:danger] = '添加失败'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = '修改成功'
      redirect_to items_path
    else
      flash.now[:danger] = '修改失败'
      render :new
    end
  end

  def destroy
    Item.delete(params[:id]) if params[:id]
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:time,:internumber,:usernumber,:yidong,:liantong,:dianxing,:signupnumber)
  end

end
