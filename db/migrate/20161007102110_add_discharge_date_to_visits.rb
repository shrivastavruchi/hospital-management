class AddDischargeDateToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :discharge_date, :string
  end
end
