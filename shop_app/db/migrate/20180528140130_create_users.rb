class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :last_login
      t.datetime :reset_sent_at
      t.string :activation_digest
      t.datetime :activated_at
      t.boolean :activated, default: false
      t.integer :role_id, default: 0

      t.timestamps
    end
  end
end
