class AddColumnPriceToProductOption < ActiveRecord::Migration[5.1]
  def change
    add_column :product_options, :price, :float
  end
end
