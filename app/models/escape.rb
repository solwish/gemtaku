class Escape < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :joins

  def require_permission?(user)
    self.user.id == user.id
  end
end
