class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes
  belongs_to :family

  has_secure_password validations: false
  
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 8}

  sluggable_column :user_name

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end
end