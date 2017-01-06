class AddFlightToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :flight, foreign_key: true
  end
end
