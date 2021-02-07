# This migration comes from spree_credits (originally 20190922152256)
class AddPurchaseTypeToSpreeMicrotransaction < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_microtransactions, :purchase_type
      add_column :spree_microtransactions, :purchase_type, :string, default: "product"
    end
  end
end
