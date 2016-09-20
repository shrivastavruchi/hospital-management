class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_date
      t.string :total_amount
      t.integer :visit_id
      t.integer :service_id
      t.integer :patient_id
      t.string :paid_charges


      t.timestamps null: false
    end
  end
end
