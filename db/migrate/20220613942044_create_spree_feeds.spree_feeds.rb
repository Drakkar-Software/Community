# This migration comes from spree_feeds (originally 20220404154347)
class CreateSpreeFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_feeds do |t|
      t.belongs_to :product

      t.string :uuid
      t.string :version

      t.timestamps
    end
  end
end
