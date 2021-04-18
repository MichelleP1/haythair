class AllowNullUserProvince < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :province_id, :int, :null => true
  end
end
