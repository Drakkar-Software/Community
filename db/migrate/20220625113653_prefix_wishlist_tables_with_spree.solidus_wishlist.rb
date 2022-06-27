# This migration comes from solidus_wishlist (originally 20111130204731)
class PrefixWishlistTablesWithSpree < SolidusSupport::Migration[4.2]
  def change
    rename_table :wishlists, :spree_wishlists
    rename_table :wished_products, :spree_wished_products
  end
end
