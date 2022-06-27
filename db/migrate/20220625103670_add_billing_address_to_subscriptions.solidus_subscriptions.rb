# This migration comes from solidus_subscriptions (originally 20200617102749)
class AddBillingAddressToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference(
      :solidus_subscriptions_subscriptions,
      :billing_address,
      type: :integer,
      index: { name: :index_subscription_billing_address_id },
      foreign_key: { to_table: :spree_addresses }
    )
  end
end
