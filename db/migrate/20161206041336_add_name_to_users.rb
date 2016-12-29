class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :time_zone, :string, default: "Central Time (US & Canada)"
  end
end
