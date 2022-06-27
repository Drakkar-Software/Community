# This migration comes from solidus_subscriptions (originally 20160825164850)
class CreateSolidusSubscriptionsSubscriptions < SolidusSupport::Migration[4.2]
  def change
    create_table :solidus_subscriptions_subscriptions do |t|
      t.date :actionable_date
      t.string :state
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
