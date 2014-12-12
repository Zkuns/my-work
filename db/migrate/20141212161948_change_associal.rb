class ChangeAssocial < ActiveRecord::Migration
  def change
    add_column :items, :company_id, :integer
    add_column :users, :company_id, :integer
    remove_column :items, :user_id
  end
end
