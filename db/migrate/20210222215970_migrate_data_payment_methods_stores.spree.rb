# This migration comes from spree (originally 20210114220232)
class MigrateDataPaymentMethodsStores < ActiveRecord::Migration[6.0]
  def up
    Spree::PaymentMethod.all.each do |payment_method|
      next if payment_method.store_ids.any?

      if payment_method[:store_id].present?
        payment_method.store_ids = payment_method[:store_id]
      else
        payment_method.store_ids = Spree::Store.ids
      end

      payment_method.save
    end
  end
end
