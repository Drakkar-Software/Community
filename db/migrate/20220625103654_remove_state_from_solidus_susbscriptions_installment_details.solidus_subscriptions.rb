# This migration comes from solidus_subscriptions (originally 20160902220242)
class RemoveStateFromSolidusSusbscriptionsInstallmentDetails < SolidusSupport::Migration[4.2]
  def change
    remove_column :solidus_subscriptions_installment_details, :state, :string
  end
end
