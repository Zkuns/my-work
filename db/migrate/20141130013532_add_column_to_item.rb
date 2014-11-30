class AddColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :signupnumber, :integer
  end
end
