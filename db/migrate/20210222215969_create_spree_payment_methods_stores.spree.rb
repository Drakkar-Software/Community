# This migration comes from spree (originally 20210114182625)
class CreateSpreePaymentMethodsStores < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_payment_methods_stores, id: false do |t|
      t.belongs_to :payment_method
      t.belongs_to :store
    end

    add_index :spree_payment_methods_stores, [:payment_method_id, :store_id], unique: true, name: 'payment_mentod_id_store_id_unique_index'
  end
end
