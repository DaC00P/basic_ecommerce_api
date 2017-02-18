class CategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
      t.integer :product_id, null: false
      t.integer :category_id, null: false
      t.timestamps null: false
    end
  end
end
