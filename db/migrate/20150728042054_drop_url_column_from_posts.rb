class DropUrlColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :url
  end
end
