class CreateCommentProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.text :content
      t.datetime :date_created

      t.timestamps
    end
  end
end
