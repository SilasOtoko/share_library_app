class Post < ActiveRecord::Base
  PER_PAGE = 6

  include Voteable
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, uniqueness: true, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :review, presence: true
  validates :categories, presence: true

  sluggable_column :title
end