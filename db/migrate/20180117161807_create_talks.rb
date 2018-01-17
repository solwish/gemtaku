class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :message,  null: false, default: ""
      t.references :club, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
