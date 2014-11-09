class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :realname
      t.string :mobile
      t.string :email
      t.string :company
      t.string :position
      t.integer :status,  limit: 255
      t.boolean :checkin
      t.string :qrcode

      t.timestamps
    end
  end
end
