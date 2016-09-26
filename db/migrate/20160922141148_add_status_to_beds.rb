class AddStatusToBeds < ActiveRecord::Migration
  def change
    add_column :beds, :status, :string
  end
end
