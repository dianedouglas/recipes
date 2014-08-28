class AddRating < ActiveRecord::Migration
  def change
    add_column :recipes, :rating, :int
  end
end
