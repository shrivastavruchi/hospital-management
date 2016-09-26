class AddRoomNoToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :room_id, :integer
    add_column :visits, :bed_id,:integer
    add_column :visits, :category_id,:integer
  end
end
