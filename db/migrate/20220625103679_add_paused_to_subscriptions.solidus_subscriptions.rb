# This migration comes from solidus_subscriptions (originally 20210905145955)
class AddPausedToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :solidus_subscriptions_subscriptions, :paused, :boolean, default: false
  end
end
