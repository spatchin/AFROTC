class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :rotc_class, default: 0
      t.boolean :cc, default: false

      t.timestamps
    end

    create_table :roles_users, id: false do |t|
      t.belongs_to :role, index: true
      t.belongs_to :user, index: true
    end
  end
end
