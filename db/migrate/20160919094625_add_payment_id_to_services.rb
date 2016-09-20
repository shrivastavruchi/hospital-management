class AddPaymentIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :payment_id, :integer
  end
end
