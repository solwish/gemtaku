class ShopAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :shop
end
