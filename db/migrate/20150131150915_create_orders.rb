class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :Order
      t.decimal :total_cost
      t.integer :quantity
      t.references :customer, index: true
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :customers
    add_foreign_key :orders, :products
  end
end
