class UserStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  validates_presence_of :user_id, :status_id
end
