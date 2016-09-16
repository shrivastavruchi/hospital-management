class CreateDischarges < ActiveRecord::Migration
  def change
    create_table :discharges do |t|
      t.string :final_diagnoses 
      t.string :discharge_date
      t.string :visit_id

      t.timestamps null: false
    end
  end
end
