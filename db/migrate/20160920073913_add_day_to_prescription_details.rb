class AddDayToPrescriptionDetails < ActiveRecord::Migration
  def change
    add_column :prescription_details, :day, :string
  end
end
