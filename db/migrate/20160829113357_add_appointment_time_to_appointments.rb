class AddAppointmentTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appoint_time, :string
  end
end
