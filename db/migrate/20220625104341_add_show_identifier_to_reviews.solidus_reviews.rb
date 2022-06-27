# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20140703200946)

class AddShowIdentifierToReviews < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_reviews, :show_identifier, :boolean, default: true
    add_index :spree_reviews, :show_identifier
  end
end
