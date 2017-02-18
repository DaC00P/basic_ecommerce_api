class Changeordersandorderitems < ActiveRecord::Migration
  def change
    add_column :orders, :order_status, :text
    remove_column :order_items, :order_status
  end
end
