class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content,         null: false, default: ""
      t.references :user, index: true, foreign_key: true
      t.references :escape
      t.timestamps null: false
    end
  end
end
