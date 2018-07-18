class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.float :price
      t.text :description
      t.integer :discount
      t.string :image_link
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
