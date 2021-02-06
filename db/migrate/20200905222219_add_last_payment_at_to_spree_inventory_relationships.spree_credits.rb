# This migration comes from spree_credits (originally 20191017175138)
class AddLastPaymentAtToSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    unless Spree::InventoryRelationship.column_names.include? "last_payment_at"
      add_column :spree_inventory_relationships, :last_payment_at, :datetime
    end
  end
end
