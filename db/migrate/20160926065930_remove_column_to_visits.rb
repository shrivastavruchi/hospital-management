class RemoveColumnToVisits < ActiveRecord::Migration
  def change
  	remove_column :visits, :room_id, :integer
    remove_column :visits, :bed_id,:integer
    remove_column :visits, :category_id,:integer
  end
end
