class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :title, :string
    add_column :users, :role, :integer
    add_column :users, :name, :string
    add_column :users, :time_zone, :string, default: "Central Time (US & Canada)"
  end
end
