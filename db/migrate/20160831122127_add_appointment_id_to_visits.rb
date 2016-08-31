class AddAppointmentIdToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :appointment_id, :integer
  end
end
