class AddNamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_first_name, :text, null: false
    add_column :users, :user_last_name, :text, null: false
    add_column :users, :username, :text, null: false
  end
end
