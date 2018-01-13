class Comment < ActiveRecord::Base
  resourcify

  belongs_to :user
  belongs_to :escape

  def require_permission?(user)
    self.user.id == user.id
  end
end
