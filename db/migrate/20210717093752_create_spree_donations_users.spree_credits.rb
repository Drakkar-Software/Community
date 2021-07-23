# This migration comes from spree_credits (originally 20210715150508)
class CreateSpreeDonationsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_donations_users do |t|
      t.belongs_to :donation
      t.belongs_to :user
    end
  end
end
