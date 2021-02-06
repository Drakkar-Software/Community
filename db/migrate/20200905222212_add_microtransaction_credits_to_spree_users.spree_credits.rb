# This migration comes from spree_credits (originally 20190727144236)
class AddMicrotransactionCreditsToSpreeUsers < ActiveRecord::Migration[4.2]
  def change
    unless Spree::User.column_names.include? "microtransaction_credits"
      add_column :spree_users, :microtransaction_credits, :decimal, precision: 15, scale: 2
    end
  end
end
