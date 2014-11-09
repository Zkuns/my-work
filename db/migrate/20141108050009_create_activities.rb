class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.boolean :actived, default: false

      t.timestamps
    end
  end
end
