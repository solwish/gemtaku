class Escape < ActiveRecord::Base
  resourcify
  
  belongs_to :user
  has_many :comments
  has_many :joins

  paginates_per 20
  def require_permission?(user)
    self.user.id == user.id
  end
end
