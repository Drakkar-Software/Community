# This migration comes from spree_credits (originally 20191209193832)
class AddInventoryRelationshipsCountToSpreeProduct < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_products, :inventory_relationships_count
      add_column :spree_products, :inventory_relationships_count, :integer, default: 0
    end
  end
end
