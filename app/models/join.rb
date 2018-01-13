class Join < ActiveRecord::Base
  resourcify

  belongs_to :user
  belongs_to :escape
end
