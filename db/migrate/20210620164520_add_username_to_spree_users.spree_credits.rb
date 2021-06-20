class AddUsernameToSpreeUsers < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_users, :username
      add_column :spree_users, :username, :string
    end
  end
end
