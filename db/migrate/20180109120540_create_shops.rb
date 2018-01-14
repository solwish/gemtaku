class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :title,              null: false, default: ""
      t.text :content,              null: false, default: ""
      t.string :region,             null: false, default: ""
      t.string :avatar,             default: ""

      t.timestamps null: false
    end
  end
end
