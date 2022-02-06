# This migration comes from spree_cloud (originally 20211215111700)
class CreateSpreeDeploymentsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_deployments_users do |t|
      t.belongs_to :deployment
      t.belongs_to :user
    end
  end
end
