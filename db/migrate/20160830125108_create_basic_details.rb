class CreateBasicDetails < ActiveRecord::Migration
  def change
    create_table :basic_details do |t|
      t.integer :patient_id
      t.string :weight
      t.string :boold_presure
      t.string :blood_group
      t.string :patient_history
      t.string :examination_details
      t.string :diagnosis

      t.timestamps null: false
    end
  end
end
