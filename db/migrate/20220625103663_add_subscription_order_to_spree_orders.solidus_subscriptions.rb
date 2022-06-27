# This migration comes from solidus_subscriptions (originally 20161017201944)
class AddSubscriptionOrderToSpreeOrders < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_orders, :subscription_order, :boolean, default: false, null: false
  end
end
