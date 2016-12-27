class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :title, :string
    add_column :users, :role, :integer
  end
end
