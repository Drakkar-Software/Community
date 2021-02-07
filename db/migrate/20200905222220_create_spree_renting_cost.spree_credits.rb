# This migration comes from spree_credits (originally 20191019114429)
class CreateSpreeRentingCost < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_renting_costs do |t|
      t.belongs_to :inventory_relationship
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
