class AddStatusToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :status, :integer
    change_column_default :comments, :status, default: 0
  end
end
