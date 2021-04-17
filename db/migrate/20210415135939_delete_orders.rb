class DeleteOrders < ActiveRecord::Migration[6.1]
  def change
    drop_table :order_lines
    drop_table :orders
  end
end
