# This migration comes from solidus_subscriptions (originally 20200617155042)
class AddPaymentSourceToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :solidus_subscriptions_subscriptions, :payment_source_type, :string
    add_column :solidus_subscriptions_subscriptions, :payment_source_id, :integer
  end
end
