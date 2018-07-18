class RenameNameToFirstName < ActiveRecord::Migration[5.1]
  def change
    rename_column :customers, :name, :first_name
  end
end
