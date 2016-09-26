class CreateVisitRooms < ActiveRecord::Migration
  def change
    create_table :visit_rooms do |t|
      t.integer :visit_id
      t.integer :room_id
      t.integer :bed_id
      t.string :date

      t.timestamps null: false
    end
  end
end
