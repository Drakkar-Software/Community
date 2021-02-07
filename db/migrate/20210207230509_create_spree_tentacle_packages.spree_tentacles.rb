# This migration comes from spree_tentacles (originally 20201130207505)
class CreateSpreeTentaclePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacle_packages do |t|
      t.belongs_to :tentacles_registry
      t.belongs_to :product

      t.string :url

      t.timestamps
    end
  end
end
