class RemoveOrderFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :Order
  end
  
  def down
    add_column :orders, :Order, :string
  end
end
