# This migration comes from solidus_subscriptions (originally 20200917072152)
class AddSubscriptionReferenceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference(
      :spree_orders,
      :subscription,
      null: true,
      type: :integer,
      foreign_key: { to_table: :solidus_subscriptions_subscriptions }
    )
  end
end
