# This migration comes from solidus_wishlist (originally 20150805204533)
class AddQuantityToWishedProducts < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_wished_products, :quantity, :integer, null: false, default: 1
  end
end
