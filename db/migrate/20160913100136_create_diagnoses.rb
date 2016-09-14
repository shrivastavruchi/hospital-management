class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.string :name
      t.integer :addmission_id
      t.integer :visit_id


      t.timestamps null: false
    end
  end
end
