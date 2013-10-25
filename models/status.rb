class Status < ActiveRecord::Base
  validates :status, presence: true

  def create
    self.created_at = Time.now
    super
  end
end
