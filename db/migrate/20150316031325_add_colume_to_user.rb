class AddColumeToUser < ActiveRecord::Migration
  def change
    add_column :users, :cooperate_type, :integer 
  end
end
