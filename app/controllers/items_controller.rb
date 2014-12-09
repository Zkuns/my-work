class ItemsController < ApplicationController
  skip_before_action :must_admin, only: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def search
    if params[:time]
      time = edit_time(params[:time])
      time.next_month = time + 1.month
      @items = Item.all(conditions:{time:(time)})
    elsif params[:time_range_1] && params[:time_range_2]
      time1 = edit(params[:time_range_1] && params[:time_range_2])
      @items = 
    else
      render nothing:true
    end
  end

  def create
    time = item_params[:time].split('-')
    puts time
    item_params[:time] = Time.new(time[0].to_s, time[1].to_s, time[2].to_s)

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
    params.require(:item).permit(:time,
                                                          :internumber,
                                                          :usernumber,
                                                          :yidong,
                                                          :liantong,
                                                          :dianxing,
                                                          :signupnumber)
  end

  def edit_time time
    time = time.split('-')
    time[2].nil?? Time.mktime(time[0], time[1]) : Time.mktime(time[0], time[1], time[2])
  end
end
