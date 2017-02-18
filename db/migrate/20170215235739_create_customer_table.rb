class CreateCustomerTable < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_first_name, null: false
      t.string :customer_last_name, null: false
      t.string :customer_email_address, null: false
      t.timestamps null: false
    end
  end
end
