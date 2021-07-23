# This migration comes from spree_credits (originally 20210715143514)
class CreateSpreeDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_donations do |t|
      t.decimal :amount, precision: 19, scale: 9, default: 0
      t.string :currency
      t.string :blockchain
      t.string :transaction_id
      t.string :address_to
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
