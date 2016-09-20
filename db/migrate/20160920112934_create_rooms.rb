class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.integer :category_id
      t.string :room_rent
      t.string :beds

      t.timestamps null: false
    end
  end
end
