# This migration comes from spree_tentacles (originally 20201130205646)
class CreateSpreeTentaclesRegistries < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacles_registries do |t|
      t.string :name
      t.string :url
      t.string :registry_type
      t.string :registry_name

      t.timestamps
    end
  end
end
