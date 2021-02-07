# This migration comes from spree_tentacles (originally 20201130208100)
class CreateSpreeTentacleVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacle_versions do |t|
      t.belongs_to :tentacle

      t.string :version
      t.string :author

      t.timestamps
    end
    add_index :spree_tentacle_versions, [:tentacle_id, :version], unique: true
  end
end
