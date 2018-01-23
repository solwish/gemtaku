class Escape < ActiveRecord::Base
  resourcify

  belongs_to :user
  has_many :comments
  has_many :joins

  paginates_per 20
  def require_permission?(user)
    self.user.id == user.id
  end

  before_save {self.title = title.strip}
  validates :title, presence: true, length: {minimum: 2, maximum: 100}
  validates :content, presence: true, length: {minimum: 2, maximum: 2500}
end
