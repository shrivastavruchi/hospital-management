class CreatePrescriptionDetails < ActiveRecord::Migration
  def change
    create_table :prescription_details do |t|
      t.string :drug_name
      t.string :description
      t.string :schedule

      t.timestamps null: false
    end
  end
end
