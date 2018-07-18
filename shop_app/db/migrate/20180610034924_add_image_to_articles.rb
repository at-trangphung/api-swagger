class AddImageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :image_link, :string
  end
end
