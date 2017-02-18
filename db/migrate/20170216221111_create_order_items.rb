class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :product_quantity, null: false
      t.string :order_status
      t.timestamps null: false
    end
  end
end
