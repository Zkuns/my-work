class AddGameType < ActiveRecord::Migration
  def change
    add_column :companies, :coo_games, :string  
    add_column :items, :coo_game, :string
  end
end
