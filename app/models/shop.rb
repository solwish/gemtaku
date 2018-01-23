class Shop < ActiveRecord::Base
  resourcify

  paginates_per 5
  has_many :shop_attachments
  accepts_nested_attributes_for :shop_attachments, allow_destroy: true


  before_save {self.title = title.strip}
  validates :title, presence: true, length: {minimum: 2, maximum: 200}
  validates :content, presence: true, length: {minimum: 2, maximum: 5000}
  validates :region, presence: true
end
