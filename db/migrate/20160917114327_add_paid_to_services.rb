class AddPaidToServices < ActiveRecord::Migration
  def change
    add_column :services, :paid, :string
  end
end
