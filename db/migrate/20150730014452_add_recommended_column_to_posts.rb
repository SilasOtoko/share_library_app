class AddRecommendedColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :recommended, :boolean, default: false
  end
end
