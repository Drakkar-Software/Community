# This migration comes from spree_tentacles (originally 20210424212122)
class AddKeyToSpreeTentacles < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_tentacles, :key
      add_column :spree_tentacles, :key, :string
    end
  end
end
