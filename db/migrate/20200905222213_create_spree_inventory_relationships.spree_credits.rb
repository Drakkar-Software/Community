# This migration comes from spree_credits (originally 20190727170855)
class CreateSpreeInventoryRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_inventory_relationships do |t|
      t.belongs_to :user
      t.belongs_to :product

      t.timestamps
    end
    add_index :spree_inventory_relationships, [:user_id, :product_id], unique: true
  end
end
