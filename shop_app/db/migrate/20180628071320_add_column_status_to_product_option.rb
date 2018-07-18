class AddColumnStatusToProductOption < ActiveRecord::Migration[5.1]
   def change
    add_column :product_options, :status, :integer, default: 1
  end
end
