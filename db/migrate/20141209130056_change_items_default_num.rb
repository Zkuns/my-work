class ChangeItemsDefaultNum < ActiveRecord::Migration

  def change
    change_column :items, :yidong, :integer, default: 0
    change_column :items, :liantong, :integer, default: 0
    change_column :items, :dianxing, :integer, default: 0
    change_column :items, :signupnumber, :integer, default: 0
    change_column :items, :usernumber, :integer, default: 0
  end

end
