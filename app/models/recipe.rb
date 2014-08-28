class Recipe < ActiveRecord::Base

  validates :name, :presence => true
  validates :description, :presence => true
  has_and_belongs_to_many :tags

  def self.search_by_tag(tag)
    @recipes = []
    Recipe.all.each do |recipe|
      recipe.tags.each do |recipe_tag|
        if recipe_tag.name == tag
          @recipes << recipe
        end
      end
    end
    @recipes
  end
end
