# This migration comes from solidus_subscriptions (originally 20210205140422)
class AddCurrencyToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :solidus_subscriptions_subscriptions, :currency, :string
  end
end
