class CreateShopAttachments < ActiveRecord::Migration
  def change
    create_table :shop_attachments do |t|
      t.integer :shop_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
