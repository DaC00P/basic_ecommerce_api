class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_description
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
