class AddVisitIdToPrescriptionDetails < ActiveRecord::Migration
  def change
    add_column :prescription_details, :visit_id, :integer
  end
end
