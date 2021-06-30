# This migration comes from spree_tentacles (originally 20210630211431)
class AddSpreeProfileToSpreeProduct < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_products, :profile_id
      add_reference :spree_products, :profile, index: true
    end
  end
end
