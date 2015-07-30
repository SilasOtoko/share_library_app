class AddRecommendedColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :recommended, :boolean, default: true
  end
end
