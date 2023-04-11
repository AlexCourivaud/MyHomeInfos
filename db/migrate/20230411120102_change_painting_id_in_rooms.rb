class ChangePaintingIdInRooms < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :painting_id, :bigint, null: true
  end
end
