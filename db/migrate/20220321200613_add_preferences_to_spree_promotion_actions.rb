class AddPreferencesToSpreePromotionActions < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_promotion_actions, :preferences, :text
  end
end
