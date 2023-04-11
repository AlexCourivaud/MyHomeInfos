class AddColumnforeignkeyToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :room, null: false, foreign_key: true
    add_reference :items, :painting, null: false, foreign_key: true
  end
end
