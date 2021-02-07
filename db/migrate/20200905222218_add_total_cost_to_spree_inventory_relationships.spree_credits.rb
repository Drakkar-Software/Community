# This migration comes from spree_credits (originally 20191013184341)
class AddTotalCostToSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    unless Spree::InventoryRelationship.column_names.include? "total_cost"
      add_column :spree_inventory_relationships, :total_cost, :decimal, precision: 10, scale: 2, default: 0
    end
  end
end
