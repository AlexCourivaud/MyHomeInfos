class CreatePaintings < ActiveRecord::Migration[7.0]
  def change
    create_table :paintings do |t|
      t.string :color
      t.string :brand
      t.date :date_painted

      t.timestamps
    end
  end
end
