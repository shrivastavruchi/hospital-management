class AddPatientIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :patient_id, :integer
  end
end
