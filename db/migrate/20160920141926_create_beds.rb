class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.string :bed_no
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
