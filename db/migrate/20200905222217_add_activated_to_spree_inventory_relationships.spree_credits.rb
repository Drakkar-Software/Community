# This migration comes from spree_credits (originally 20191013183827)
class AddActivatedToSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_inventory_relationships, :activated
      add_column :spree_inventory_relationships, :activated, :boolean, default: true
    end
  end
end
