# This migration comes from spree_subscriptions (originally 20220529122244)
class CreateSpreeSubscriptionFrequencies < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_subscription_frequencies do |t|
      t.string :title
      t.integer "days_count", default: 0
      t.integer "months_count", default: 0

      t.timestamps null: false
    end
  end
end
