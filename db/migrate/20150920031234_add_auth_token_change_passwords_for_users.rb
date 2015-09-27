class AddAuthTokenChangePasswordsForUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :auth_token, :string
    remove_column :users, :password
    add_index :users, :auth_token
  end
end
