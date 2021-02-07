# This migration comes from spree_backtesting (originally 20190921190409)
class CreateSpreeBacktestingRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_backtesting_runs do |t|
      t.references :product
      t.belongs_to :user
      t.decimal :cost, precision: 10, scale: 2
      t.string :run_type
      t.json :configuration
      t.json :report
      t.timestamps
    end
    add_index :spree_backtesting_runs, [:user_id, :product_id]
  end
end
