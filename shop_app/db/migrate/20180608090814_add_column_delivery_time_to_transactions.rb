class AddColumnDeliveryTimeToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :delivery_time, :datetime
  end
end
