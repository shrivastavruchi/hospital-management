class AddExpireDateTomedicines < ActiveRecord::Migration
  def change
  	add_column :medicines, :expire_date, :string
  	add_column :medicines, :quantity, :string
  end
end
