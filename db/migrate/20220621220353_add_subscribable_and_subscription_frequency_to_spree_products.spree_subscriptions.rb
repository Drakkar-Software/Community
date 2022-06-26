# This migration comes from spree_subscriptions (originally 20220529082140)
class AddSubscribableAndSubscriptionFrequencyToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_products, :subscription_frequency, index: true
    add_column :spree_products, :subscribable, :boolean, default: false
    add_index :spree_products, :subscribable
  end
end
