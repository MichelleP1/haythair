class DeleteTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :line_items
    drop_table :baskets

  end
end
