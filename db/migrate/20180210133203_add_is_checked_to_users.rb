class AddIsCheckedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_checked, :boolean, null: false, default: false
  end
end
