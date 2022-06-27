# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20190613165528)

class AddVerifiedPurchaserToReviews < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_reviews, :verified_purchaser, :boolean, default: false
  end
end
