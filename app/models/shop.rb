class Shop < ActiveRecord::Base
  paginates_per 5
  mount_uploader :avatar, AvatarUploader
end
