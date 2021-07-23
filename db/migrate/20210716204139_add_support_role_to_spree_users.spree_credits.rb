# This migration comes from spree_credits (originally 20210715154103)
class AddSupportRoleToSpreeUsers < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_users, :support_role
      add_column :spree_users, :support_role, :string, default: :default
    end
  end
end
