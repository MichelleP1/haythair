class AddPaymentColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_id, :string
    add_column :orders, :payment_paid, :boolean
  end
end
