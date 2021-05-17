# This migration comes from spree_tentacles (originally 20210418141735)
class AddAccessibilityToSpreeTentacles < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_tentacles, :accessibility
      add_column :spree_tentacles, :accessibility, :string
    end
  end
end
