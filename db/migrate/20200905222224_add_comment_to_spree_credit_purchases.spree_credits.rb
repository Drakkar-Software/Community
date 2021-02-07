# This migration comes from spree_credits (originally 20191209202721)
class AddCommentToSpreeCreditPurchases < ActiveRecord::Migration[5.2]
  def change
    unless Spree::CreditsPurchase.column_names.include? "comment"
      add_column :spree_credits_purchases, :comment, :string
    end
  end
end
