class AddBedIdToAddmissions < ActiveRecord::Migration
  def change
    add_column :addmissions, :bed_id, :integer
  end
end
