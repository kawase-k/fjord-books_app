class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :postal_code, :string, null: false, default: ""
    add_column :users, :address, :text, null: false, default: ""
    add_column :users, :description, :text, null: false, default: ""
  end
end
