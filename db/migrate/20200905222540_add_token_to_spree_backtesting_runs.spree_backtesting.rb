# This migration comes from spree_backtesting (originally 20190924205451)
class AddTokenToSpreeBacktestingRuns < ActiveRecord::Migration[5.2]
  def change
    unless column_exists? :spree_backtesting_runs, :token
      add_column :spree_backtesting_runs, :token, :string
    end
    add_index :spree_backtesting_runs, :token
  end
end
