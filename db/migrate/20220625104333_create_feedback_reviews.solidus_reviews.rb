# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20101222083309)

class CreateFeedbackReviews < SolidusSupport::Migration[4.2]
  def self.up
    create_table :feedback_reviews do |t|
      t.integer :user_id
      t.integer :review_id, null: false
      t.integer :rating,    default: 0
      t.text    :comment
      t.timestamps
    end
    add_index :feedback_reviews, :review_id
    add_index :feedback_reviews, :user_id
  end

  def self.down
    drop_table :feedback_reviews
  end
end
