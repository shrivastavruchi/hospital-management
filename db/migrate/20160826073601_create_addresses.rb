class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :country
      t.string :state
      t.string :pin_code

      t.timestamps null: false
    end
  end
end
