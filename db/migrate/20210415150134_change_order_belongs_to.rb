class ChangeOrderBelongsTo < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :product_id, :integer
    add_column :order_items, :furniture_id, :integer, references: :furniture
  end
end
