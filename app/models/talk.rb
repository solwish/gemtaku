class Talk < ActiveRecord::Base
  belongs_to :club
  belongs_to :user
  paginates_per 20

  before_save {self.message = message.strip}
  validates :message, presence: true, length: {minimum: 1, maximum: 200}
end
