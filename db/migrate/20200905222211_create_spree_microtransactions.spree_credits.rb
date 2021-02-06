# This migration comes from spree_credits (originally 20190726161750)
class CreateSpreeMicrotransactions < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_microtransactions do |t|
      t.references :product
      t.decimal :amount, precision: 10, scale: 2
      t.belongs_to :user
      t.timestamps
    end
    add_index :spree_microtransactions, :user_id
  end
end
