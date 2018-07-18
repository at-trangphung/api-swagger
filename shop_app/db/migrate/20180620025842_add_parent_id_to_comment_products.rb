class AddParentIdToCommentProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_products, :parent_id, :integer
  end
end
