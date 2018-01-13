class Shop < ActiveRecord::Base
  resourcify

  paginates_per 5
  mount_uploader :avatar, AvatarUploader
end
