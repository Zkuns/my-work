class ItemsController < ApplicationController
  skip_before_action :must_admin, only: [:index, :search]
  skip_before_action :must_login_in, only: :search
  before_action :compare

  def index
    @com = Company.find(params[:company_id])
    time1 = Time.now.beginning_of_month
    time2 = Time.now.end_of_month
    @items = @com.items.where(time: time1..time2).order(time: :desc, coo_game: :asc)
    @games = @com.games
  end

  def new
    @com = Company.find(params[:company_id])
    @item = @com.items.new
    @games = @com.games.map { |game| game.name}
  end

  def search
    @com = Company.find(params[:company_id])
    @games = @com.games.map
    if !params[:start].blank? || !params[:end].blank?
      time1 = edit_time(params[:start]) || Time.mktime('1971')
      time2 = edit_time(params[:end]) || Time.mktime('2020')
    else
      time1 = edit_time(params[:month]) || Time.now.beginning_of_month
      time2 = edit_time(params[:month]) || Time.now.end_of_month
    end
    @items = @com.items.where(time: time1..time2).order(time: :desc, coo_game: :asc)
    @items = @items.where(coo_game: params[:coo_game]) 
    render :index
  end

  def create
    time = item_params[:time].split('-')
    item_params[:time] = Time.new(time[0].to_s, time[1].to_s, time[2].to_s)
    @com = Company.find(params[:company_id])
    @item = @com.items.new(item_params)
    if @item.save
      flash[:success] = '添加成功'
      redirect_to company_items_path
    else
      flash.now[:danger] = '添加失败'
      render :new
    end
  end

  def edit
    @com = Company.find(params[:company_id])
    @item = Item.find(params[:id])
    @games = @com.games.map{ |game| game.name }
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = '修改成功'
      redirect_to company_items_path
    else
      flash.now[:danger] = '修改失败'
      render :edit
    end
  end

  def destroy
    Item.delete(params[:id]) if params[:id]
    redirect_to company_items_path
  end

  private

  def item_params
    params.require(:item).permit(:time,:internumber,:usernumber,
                                :yidong,:liantong,:dianxing,
                                :signupnumber,:coo_game)
  end

  def edit_time time
    return nil if time.blank?
    time = time.split('-')
    return nil if time[0].nil?
    time[2].nil?? Time.mktime(time[0], time[1]) : Time.mktime(time[0], time[1], time[2])
  end

  def compare
    @com = Company.find(params[:company_id])
    unless current_user.admin?
      redirect_to company_items_path(current_user.company) unless current_user.company == @com
    end
  end
end
