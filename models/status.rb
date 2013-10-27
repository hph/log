class Status < ActiveRecord::Base
  has_one :user_status, dependent: :destroy
  has_one :user, through: :user_status
  validates :status, presence: true

  def create
    self.created_at = Time.now
    super
  end
end
