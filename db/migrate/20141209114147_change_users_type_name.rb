class ChangeUsersTypeName < ActiveRecord::Migration
  def change
    remove_column :users, :type, :integer
    add_column :users, :coo_type, :integer 
  end
end
