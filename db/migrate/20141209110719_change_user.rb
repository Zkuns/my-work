class ChangeUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :boolean, default: false
    add_column :items, :user_id, :integer
  end
end
