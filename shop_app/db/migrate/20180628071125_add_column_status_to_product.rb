class AddColumnStatusToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :status, :integer, default: 1
  end
end
