class RemoveCryptedPasswordSaltRemememberMeTokenRememberMeTokenExpriresAtFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :crypted_password
    remove_column :users, :salt
    remove_column :users, :remember_me_token
    remove_column :users, :remember_me_token_expires_at
  end

  def down
    add_column :users, :remember_me_token_expires_at, :timestamp
    add_column :users, :remember_me_token, :string
    add_column :users, :salt, :string
    add_column :users, :crypted_password, :string
  end
end
