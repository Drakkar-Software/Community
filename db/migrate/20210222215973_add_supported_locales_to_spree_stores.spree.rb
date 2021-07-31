# This migration comes from spree (originally 20210205211040)
class AddSupportedLocalesToSpreeStores < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:spree_stores, :supported_locales)
      add_column :spree_stores, :supported_locales, :string
      Spree::Store.reset_column_information
      Spree::Store.all.each do |store|
        store.update_attribute(:supported_locales, store.default_locale)
      end
    end
  end
end
