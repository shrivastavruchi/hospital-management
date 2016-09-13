class AddAddmissionIdToPrescriptionDetails < ActiveRecord::Migration
  def change
    add_column :prescription_details, :addmission_id, :integer
    add_column :prescription_details, :quantity, :string
  end
end
