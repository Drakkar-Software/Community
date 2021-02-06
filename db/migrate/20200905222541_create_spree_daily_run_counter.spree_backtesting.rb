# This migration comes from spree_backtesting (originally 20191005161110)
class CreateSpreeDailyRunCounter < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_daily_run_counters do |t|
      t.date :last_run_date
      t.integer :runs_count
      t.string :run_type
      t.string :runner_id
      t.timestamps
    end
    add_index :spree_daily_run_counters, [:runner_id, :run_type]
  end
end
