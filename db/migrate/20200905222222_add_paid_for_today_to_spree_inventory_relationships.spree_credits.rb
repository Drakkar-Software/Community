# This migration comes from spree_credits (originally 20191029221107)
class AddPaidForTodayToSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_inventory_relationships, :paid_for_today
      add_column :spree_inventory_relationships, :paid_for_today, :boolean, default: true
    end
  end
end
