class CreateFurnitures < ActiveRecord::Migration[6.1]
  def change
    create_table :furnitures do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :weight
      t.integer :stock
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
