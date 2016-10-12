class AddAmountPaidToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :amount_paid, :string
  end
end
