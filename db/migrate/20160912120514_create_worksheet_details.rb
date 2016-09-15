class CreateWorksheetDetails < ActiveRecord::Migration
  def change
    create_table :worksheet_details do |t|
      t.integer :addmission_id
      t.string :medicine_name
      t.string :quantity
      t.string :type
      t.string :blood_presure
      t.string :date
      t.string :time
      t.integer :visit_id
      t.string :weight
      t.string :height
      t.string :pulse_rate

      t.timestamps null: false
    end
  end
end
