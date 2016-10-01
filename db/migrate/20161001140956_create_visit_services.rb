class CreateVisitServices < ActiveRecord::Migration
  def change
    create_table :visit_services do |t|
      t.integer :visit_id
      t.integer :service_id
      t.string :quantity

      t.timestamps null: false
    end
  end
end
