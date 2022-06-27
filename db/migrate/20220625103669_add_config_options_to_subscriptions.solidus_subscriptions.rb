# This migration comes from solidus_subscriptions (originally 20170112012407)
class AddConfigOptionsToSubscriptions < SolidusSupport::Migration[4.2]
  def change
    add_column :solidus_subscriptions_subscriptions, :interval_length, :integer
    add_column :solidus_subscriptions_subscriptions, :interval_units, :integer
    add_column :solidus_subscriptions_subscriptions, :end_date, :datetime
  end
end
