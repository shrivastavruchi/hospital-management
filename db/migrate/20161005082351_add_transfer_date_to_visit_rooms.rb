class AddTransferDateToVisitRooms < ActiveRecord::Migration
  def change
  	remove_column :visit_rooms, :date, :string
    add_column :visit_rooms, :start_date, :string
    add_column :visit_rooms, :end_date, :string
  end
end
