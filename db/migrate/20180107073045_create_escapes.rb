class CreateEscapes < ActiveRecord::Migration
  def change
    create_table :escapes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title,               null: false, default: ""
      t.text :contents,              null: false, default: ""
      t.string :region,              null: false, default: ""

      t.timestamps null: false
    end
  end
end
