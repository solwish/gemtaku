class Shop < ActiveRecord::Base
  resourcify

  paginates_per 5
  mount_uploader :avatar, AvatarUploader

  before_save {self.title = title.strip}
  validates :title, presence: true, length: {minimum: 2, maximum: 200}
  validates :content, presence: true, length: {minimum: 2, maximum: 5000}
  validates :region, presence: true
end
