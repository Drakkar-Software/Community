# This migration comes from spree_tentacles (originally 20201215213046)
class CreateSpreeTentaclePackageVersionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacle_package_version_items do |t|
      t.belongs_to :tentacle_version, index: { name: 'idx_package_items_on_tentacle_version_id' }
      t.belongs_to :tentacle_package_version, index: { name: 'idx_package_items_on_package_version_id' }

      t.timestamps
     end
  end
end
