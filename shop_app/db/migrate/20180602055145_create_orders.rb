class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :cart_id
      t.float :total_payment
      t.integer :status
      t.text :data
      t.integer :quantity
     
      t.timestamps
    end
  end
end
