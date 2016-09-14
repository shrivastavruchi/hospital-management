class AddRoomNoToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :room_no, :string
  end
end
