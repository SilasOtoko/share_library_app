class DropFamiliesTable < ActiveRecord::Migration
  def change
    drop_table :families
  end
end
