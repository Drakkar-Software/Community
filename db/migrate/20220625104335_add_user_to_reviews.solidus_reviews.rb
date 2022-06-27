# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20110606150524)

class AddUserToReviews < SolidusSupport::Migration[4.2]
  def self.up
    add_column :reviews, :user_id, :integer, null: true
  end

  def self.down
    remove_column :reviews, :user_id
  end
end
