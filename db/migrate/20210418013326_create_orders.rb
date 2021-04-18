class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.decimal :pst
      t.decimal :hst
      t.decimal :gst

      t.timestamps
    end
  end
end
