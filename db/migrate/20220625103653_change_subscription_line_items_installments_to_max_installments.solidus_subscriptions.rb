# This migration comes from solidus_subscriptions (originally 20160829201653)
class ChangeSubscriptionLineItemsInstallmentsToMaxInstallments < SolidusSupport::Migration[4.2]
  def change
    rename_column :solidus_subscriptions_line_items, :installments, :max_installments
  end
end
