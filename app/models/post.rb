class Post < ActiveRecord::Base

  include Voteable
  include Sluggable

  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :url, presence: true

  sluggable_column :title
end