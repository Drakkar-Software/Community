# This migration comes from spree_credits (originally 20220206120000)
class AddUniquenessConstraintToSpreeDonations < ActiveRecord::Migration[6.1]
  def change
    add_index :spree_donations, [:transaction_id, :blockchain], unique: true, name: 'unique_spree_donations_transaction_id_per_blockchain'
  end
end
