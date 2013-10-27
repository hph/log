class User < ActiveRecord::Base
  has_many :user_statuses
  has_many :statuses, through: :user_statuses, dependent: :destroy
end
