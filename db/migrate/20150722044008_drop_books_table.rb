class DropBooksTable < ActiveRecord::Migration
  def change
    drop_table :books
  end
end
