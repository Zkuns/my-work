class AddColumeToApply < ActiveRecord::Migration
  def change
    add_column :applies, :activity_id, :integer
  end
end
