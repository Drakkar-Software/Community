class CreateSpreeDeployments < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_deployments do |t|
      t.belongs_to :host
      t.belongs_to :user
      t.belongs_to :order

      t.string :uuid
      t.string :origin_url
      t.string :url
      t.string :name
      t.integer :status
      t.string :extra

      t.timestamps
    end

    add_index :spree_deployments, :user_id
    add_index :spree_deployments, :order_id
  end
end
