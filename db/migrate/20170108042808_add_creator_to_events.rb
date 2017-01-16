class AddCreatorToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :creator, index: true
  end
end
