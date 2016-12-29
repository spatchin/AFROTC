class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :location
      t.datetime :date
      t.boolean :mandatory

      t.timestamps
    end

    create_table :events_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
    end
  end
end
