# This migration comes from solidus_wishlist (originally 20140422003308)
class AddIndexToWishlists < SolidusSupport::Migration[4.2]
  def change
    add_index :spree_wishlists, [:user_id]
    add_index :spree_wishlists, [:user_id, :is_default]
  end
end
