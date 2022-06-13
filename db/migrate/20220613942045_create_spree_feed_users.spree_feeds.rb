# This migration comes from spree_feeds (originally 20220404154348)
class CreateSpreeFeedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_feed_users do |t|
      t.belongs_to :feed
      t.belongs_to :user

      t.boolean :is_publisher, default: false

      t.timestamps
    end
  end
end
