# This migration comes from spree_tentacles (originally 20201130207807)
class CreateSpreeTentaclePackageVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacle_package_versions do |t|
      t.belongs_to :tentacle_package

      t.string :version

      t.timestamps
    end
  end
end
