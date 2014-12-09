class ModifyUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :company, :string
    add_column :users, :name, :string
    remove_column :users, :password_digest, :string
  end
end
