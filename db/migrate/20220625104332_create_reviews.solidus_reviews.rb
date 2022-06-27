# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20081020220724)

class CreateReviews < SolidusSupport::Migration[4.2]
  def self.up
    create_table :reviews do |t|
      t.integer :product_id
      t.string  :name
      t.string  :location
      t.integer :rating
      t.text    :title
      t.text    :review
      t.boolean :approved, default: false
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
