# This migration comes from spree_credits (originally 20191027112155)
class AddPromotionRatioToSpreeInventoryRelationship < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_inventory_relationships, :promotion_ratio
      add_column :spree_inventory_relationships, :promotion_ratio, :decimal, precision: 5, scale: 2, default: 0
    end
  end
end
