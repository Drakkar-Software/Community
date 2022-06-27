# This migration comes from solidus_subscriptions (originally 20161017175509)
class RemoveOrderIdFromSolidusSubscriptionsInstallments < SolidusSupport::Migration[4.2]
  def change
    remove_column :solidus_subscriptions_installments, :order_id, :integer
  end
end
