# This migration comes from spree_tentacles (originally 20210418144847)
class AddAccessibilityToSpreeTentaclePackages < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_tentacle_packages, :accessibility
      add_column :spree_tentacle_packages, :accessibility, :string
    end
  end
end
