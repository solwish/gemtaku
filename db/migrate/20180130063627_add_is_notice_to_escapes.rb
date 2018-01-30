class AddIsNoticeToEscapes < ActiveRecord::Migration
  def change
    add_column :escapes, :is_notice, :boolean, null: false, default: false
  end
end
