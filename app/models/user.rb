class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  belongs_to :family

  has_secure_password validations: false
  
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 8}
end