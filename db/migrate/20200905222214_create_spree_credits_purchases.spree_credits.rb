# This migration comes from spree_credits (originally 20190825222555)
class CreateSpreeCreditsPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_credits_purchases do |t|
      t.belongs_to :user
      t.string :address_from
      t.string :address_to
      t.string :transaction_id
      t.string :currency
      t.decimal :currency_amount, precision: 19, scale: 9
      t.decimal :credits_amount, precision: 12, scale: 2
      t.string :purchase_status
      t.boolean :credited
      t.timestamps
    end
  end

end
