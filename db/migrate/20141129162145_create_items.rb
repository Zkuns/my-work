class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.datetime :time
      t.string :internumber
      t.integer :usernumber
      t.integer :yidong
      t.integer :liantong
      t.integer :dianxing

      t.timestamps
    end
  end
end
