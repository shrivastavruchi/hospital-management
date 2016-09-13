class AddColumnToWorkSheetDetails < ActiveRecord::Migration
  def change
  	add_column :worksheet_details, :weight, :string
    add_column :worksheet_details, :height, :string
    add_column :worksheet_details, :pulse_rate, :string
    add_column :worksheet_details, :user_id, :integer
  end
end
