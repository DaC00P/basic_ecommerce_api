class ChangeCustomerTable < ActiveRecord::Migration
  def change
    add_column :customers, :username, :text, null: false
  end
end
