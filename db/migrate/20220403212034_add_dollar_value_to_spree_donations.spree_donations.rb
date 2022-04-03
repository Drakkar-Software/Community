# This migration comes from spree_donations (originally 20220403211553)
class AddDollarValueToSpreeDonations < ActiveRecord::Migration[6.1]
  def change
    unless column_exists? :spree_donations, :dollar_value
      add_column :spree_donations, :dollar_value, :decimal, default: 0
    end
  end
end
