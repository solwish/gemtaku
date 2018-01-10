class Shop < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
