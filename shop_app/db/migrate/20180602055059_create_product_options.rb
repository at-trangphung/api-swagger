class CreateProductOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_options do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :type_id
      
      t.timestamps
    end
  end
end
