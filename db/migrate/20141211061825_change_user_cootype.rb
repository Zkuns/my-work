class ChangeUserCootype < ActiveRecord::Migration
  def change
    change_column :users, :coo_type, :boolean
  end
end
