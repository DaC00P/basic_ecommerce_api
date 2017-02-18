class ChangeProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :integer, null: false
  end
end
