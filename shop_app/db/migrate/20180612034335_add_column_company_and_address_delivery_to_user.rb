class AddColumnCompanyAndAddressDeliveryToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company, :string
    add_column :users, :address_deliver, :string
  end
end
