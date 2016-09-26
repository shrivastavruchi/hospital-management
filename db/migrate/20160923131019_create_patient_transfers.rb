class CreatePatientTransfers < ActiveRecord::Migration
  def change
    create_table :patient_transfers do |t|
      t.string :date_transfer
      t.integer :user_id
      t.integer :room_id
      t.integer :bed_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
