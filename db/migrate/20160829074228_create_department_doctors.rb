class CreateDepartmentDoctors < ActiveRecord::Migration
  def change
    create_table :department_doctors do |t|
      t.string :name
      t.string :age
      t.string :specialization
      t.string :email
      t.string :password
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
