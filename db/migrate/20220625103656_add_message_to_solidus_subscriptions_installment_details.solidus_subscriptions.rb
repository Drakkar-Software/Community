# This migration comes from solidus_subscriptions (originally 20160902221218)
class AddMessageToSolidusSubscriptionsInstallmentDetails < SolidusSupport::Migration[4.2]
  def change
    add_column :solidus_subscriptions_installment_details, :message, :string
  end
end
