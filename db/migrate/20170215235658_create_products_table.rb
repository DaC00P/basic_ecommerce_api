class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :out_of_stock, :default => false, null: false
      t.timestamps null: false
    end
  end
end
