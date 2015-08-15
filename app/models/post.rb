class Post < ActiveRecord::Base
  PER_PAGE = 6

  include Voteable
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_one :post_category
  has_one :category, through: :post_category

  validates :title, uniqueness: true, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :review, presence: true
  validates :category, presence: true

  sluggable_column :title
end