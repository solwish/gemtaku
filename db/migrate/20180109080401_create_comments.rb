class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :contents
      t.references :user, index: true, foreign_key: true
      t.references :escape
      t.timestamps null: false
    end
  end
end
