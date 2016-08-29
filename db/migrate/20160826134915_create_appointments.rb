class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.string :consulation_type
      t.integer :doctor_id
      t.string :date

      t.timestamps null: false
    end
  end
end
