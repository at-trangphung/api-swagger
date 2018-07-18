class AddColumnLastNameToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :last_name, :string
  end
end
