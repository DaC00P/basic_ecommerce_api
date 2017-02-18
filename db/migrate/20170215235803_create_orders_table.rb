class CreateOrdersTable  < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :number_items
    end
  end
end
