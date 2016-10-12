class AddcolumnToDischrges < ActiveRecord::Migration
  def change
  	add_column :discharges, :reason_for_addmission, :string
  end
end
