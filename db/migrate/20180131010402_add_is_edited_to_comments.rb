class AddIsEditedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_edited, :boolean, null: false, default: false
  end
end
