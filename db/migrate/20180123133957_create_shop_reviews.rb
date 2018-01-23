class CreateShopReviews < ActiveRecord::Migration
  def change
    create_table :shop_reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :user, index: true, foreign_key: true
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
