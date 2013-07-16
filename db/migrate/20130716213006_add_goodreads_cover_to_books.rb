class AddGoodreadsCoverToBooks < ActiveRecord::Migration
  def change
    add_column :books, :goodreadscover, :string
  end
end
