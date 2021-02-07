# This migration comes from spree_tentacles (originally 20201209193832)
class AddSpreeTentaclePackageToSpreeProduct < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_products, :tentacle_package_id
      add_reference :spree_products, :tentacle_package, index: true
    end
  end
end
