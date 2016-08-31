class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :charges
      t.integer :visit_id

      t.timestamps null: false
    end
  end
end
