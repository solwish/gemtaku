class Comment < ActiveRecord::Base
  resourcify

  belongs_to :user
  belongs_to :escape

  def require_permission?(user)
    self.user.id == user.id
  end

  before_save {self.content = content.strip}
  validates :content, presence: true, length: {minimum: 1, maximum: 300}
end
