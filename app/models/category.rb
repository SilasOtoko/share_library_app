class Category < ActiveRecord::Base
  include Sluggable

  has_one :post_category
  has_many :posts, through: :post_categories
  
  sluggable_column :name
end