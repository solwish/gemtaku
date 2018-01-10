class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :title
      t.text :content
      t.string :region
      t.string :avatar

      t.timestamps null: false
    end
  end
end
