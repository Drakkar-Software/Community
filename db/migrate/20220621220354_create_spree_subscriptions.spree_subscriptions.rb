# This migration comes from spree_subscriptions (originally 20220529104012)
class CreateSpreeSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_subscriptions do |t|
      t.references :parent_order, index: true
      t.references :subscription_frequency, index: true
      t.references :ship_address, index: true
      t.references :bill_address, index: true

      t.text :cancellation_reasons

      t.date :last_recurrence_at, index: true
      t.date :cancelled_at, index: true
      t.date :next_occurrence_at

      t.boolean :enabled, default: true, null: false, index: true
      t.boolean :paused, default: false, null: false, index: true
      t.boolean :next_occurrence_possible, default: true

      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
