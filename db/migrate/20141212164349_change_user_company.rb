class ChangeUserCompany < ActiveRecord::Migration
  def change
    remove_column :users, :company
    add_column :users, :company, :string
  end
end
