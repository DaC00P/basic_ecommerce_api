class Addcategoryname < ActiveRecord::Migration
  def change
    add_column :categories, :name, :text, null: false
  end
end
