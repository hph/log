class UserStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  validates_presence_of :user_id
  validates_presence_of :status_id
end
