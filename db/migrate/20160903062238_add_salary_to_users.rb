class AddSalaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salary, :string
    add_column :users, :specilization, :string
    add_column :users, :department_id, :integer
  end
end
