class ChangePaintingIdInItems < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :painting_id, :bigint, null: true
  end
end
