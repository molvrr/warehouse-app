class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :corporate_name
      t.string :trade_name
      t.string :registration_number
      t.string :email
      t.string :full_address
      t.string :phone_number
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
