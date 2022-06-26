# This migration comes from spree_subscriptions (originally 20220529134030)
class CreateSpreeSubscriptionActions < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_subscription_actions do |t|
      t.belongs_to :subscription, index: true

      t.string :uuid
      t.string :type

      t.integer :status

      t.json :inputs
      t.json :state
      t.json :outputs

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
