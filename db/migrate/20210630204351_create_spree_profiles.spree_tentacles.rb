# This migration comes from spree_tentacles (originally 20210630192042)
class CreateSpreeProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_profiles do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.belongs_to :tentacles_registry

      t.string :name
      t.string :description
      t.string :version
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
