class Status < ActiveRecord::Base
  has_one :user_status, dependent: :destroy
  has_one :user, through: :user_status
  validates_presence_of :status

  def self.default_scope
    order('created_at DESC')
  end

  def create
    self.created_at = Time.now
    super
  end
end
