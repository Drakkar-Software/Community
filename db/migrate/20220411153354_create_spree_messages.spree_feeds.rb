# This migration comes from spree_feeds (originally 20220404154349)
class CreateSpreeMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_messages do |t|
      t.belongs_to :feed
      t.belongs_to :user

      t.string :uuid
      t.text :value
      t.string :version
      t.string :topic

      t.timestamps
    end
  end
end
