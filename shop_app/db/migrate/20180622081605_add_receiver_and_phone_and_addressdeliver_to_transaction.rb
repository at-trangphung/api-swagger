class AddReceiverAndPhoneAndAddressdeliverToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :receiver, :string
    add_column :transactions, :phone_rec, :integer
    add_column :transactions, :address_deliver_rec, :string
  end
end
