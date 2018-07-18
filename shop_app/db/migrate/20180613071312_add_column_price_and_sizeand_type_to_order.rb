class AddColumnPriceAndSizeandTypeToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :price, :float
    add_column :orders, :size, :string
    add_column :orders, :type, :string
  end
end
