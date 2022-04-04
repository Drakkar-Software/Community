# This migration comes from spree_cloud (originally 20220404154349)
class CreateSpreeSignals < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_signals do |t|
      t.belongs_to :product
      t.belongs_to :user

      t.string :uuid
      t.text :value
      t.string :version

      t.timestamps
    end
  end
end
