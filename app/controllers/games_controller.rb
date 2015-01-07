class GamesController < ApplicationController
  before_action :find_company

  def index
    @games = @company.games
  end

  def new
    @game = @company.games.new
  end

  def create
    if @company.games.create(name: params[:game][:name])
      redirect_to company_games_path
    else
      render :new
    end
  end

  def destroy
    @game = @company.games.find(params[:id]).destroy if params[:id]
    redirect_to company_games_path
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

end
