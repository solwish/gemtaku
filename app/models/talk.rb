class Talk < ActiveRecord::Base
  belongs_to :club
  belongs_to :user

  before_save {self.message = message.strip}
  validates :message, presence: true, length: {minimum: 1, maximum: 100}
end
