# This migration comes from solidus_subscriptions (originally 20170106224713)
class ChangeLineItemMaxInstallmentsToEndDate < SolidusSupport::Migration[4.2]
  def change
    remove_column :solidus_subscriptions_line_items, :max_installments
    add_column :solidus_subscriptions_line_items, :end_date, :date
  end
end
