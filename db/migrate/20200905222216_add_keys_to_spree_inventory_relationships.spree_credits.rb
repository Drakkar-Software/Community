# This migration comes from spree_credits (originally 20191013182421)
class AddKeysToSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_inventory_relationships, :secret_key
      add_column :spree_inventory_relationships, :secret_key, :string
    end
    unless column_exists? :spree_inventory_relationships, :current_access_token
      add_column :spree_inventory_relationships, :current_access_token, :string, default: ""
    end
    add_index :spree_inventory_relationships, [:secret_key], unique: true
  end
end
