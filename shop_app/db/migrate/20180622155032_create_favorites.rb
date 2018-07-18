class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
