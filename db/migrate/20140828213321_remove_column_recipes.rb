class RemoveColumnRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :rating, :int
  end
end
