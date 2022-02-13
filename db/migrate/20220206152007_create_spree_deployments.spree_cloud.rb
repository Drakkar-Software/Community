# This migration comes from spree_cloud (originally 20211215154349)
class CreateSpreeDeployments < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_deployments do |t|
      t.belongs_to :host
      t.string :uuid
      t.string :origin_url
      t.string :url
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
