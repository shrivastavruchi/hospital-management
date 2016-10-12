class AddMedicineIdToPrescriptionDetails < ActiveRecord::Migration
  def change
    add_column :prescription_details, :medicine_id, :integer
    remove_column :prescription_details, :drug_name, :string
  end
end
