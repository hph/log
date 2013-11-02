class User < ActiveRecord::Base
  include BCrypt

  has_many :user_statuses
  has_many :statuses, through: :user_statuses, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
end
