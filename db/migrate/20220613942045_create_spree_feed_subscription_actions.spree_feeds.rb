# This migration comes from spree_feeds (originally 20220404154348)
class CreateSpreeFeedSubscriptionActions < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_feed_subscription_actions do |t|
      t.belongs_to :feed
      t.belongs_to :subscription_action

      t.boolean :is_publisher, default: false

      t.timestamps
    end
  end
end
