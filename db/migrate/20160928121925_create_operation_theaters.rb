class CreateOperationTheaters < ActiveRecord::Migration
  def change
    create_table :operation_theaters do |t|
      t.integer :visit_id
      t.string :from_date
      t.string :end_date
      t.string :end_time
      t.string :operation_name
      t.integer :doctor_id
      t.string :from_time
      t.string :notes
      t.string :operation_procedure

      t.timestamps null: false
    end
  end
end
