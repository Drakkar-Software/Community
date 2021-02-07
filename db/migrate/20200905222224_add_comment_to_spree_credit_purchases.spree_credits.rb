# This migration comes from spree_credits (originally 20191209202721)
class AddCommentToSpreeCreditPurchases < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_credits_purchases, :comment
      add_column :spree_credits_purchases, :comment, :string
    end
  end
end
