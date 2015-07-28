class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :review, :text
  end
end
