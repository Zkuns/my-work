class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin, default: false
      t.string :remember_token

      t.timestamps
    end
  end
end
