# This migration comes from solidus_subscriptions (originally 20161006191003)
class AddSkipCountToSolidusSubscriptionsSubscriptions < SolidusSupport::Migration[4.2]
  def change
    add_column :solidus_subscriptions_subscriptions, :skip_count, :integer, default: 0, null: false
  end
end
