class CreateEscapes < ActiveRecord::Migration
  def change
    create_table :escapes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :contents
      t.string :region

      t.timestamps null: false
    end
  end
end
