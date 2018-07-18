class RenameCartIdToTransactionId < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :cart_id, :transaction_id
  end
end
