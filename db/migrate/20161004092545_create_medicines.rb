class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :medicine_name
      t.string :charges

      t.timestamps null: false
    end
  end
end
