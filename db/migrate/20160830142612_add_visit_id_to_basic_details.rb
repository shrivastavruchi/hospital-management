class AddVisitIdToBasicDetails < ActiveRecord::Migration
  def change
    add_column :basic_details, :visit_id, :integer
  end
end
