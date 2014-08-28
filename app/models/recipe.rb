class Recipe < ActiveRecord::Base

  validates :name, :presence => true
  validates :description, :presence => true
  has_and_belongs_to_many :tags

  def self.search_by_tag(tags)
    @recipes = []
    @search_tags = tags.split(" ")
    @search_tags.each do |input_tag_name|
      Recipe.all.each do |recipe|
        recipe.tags.each do |recipe_tag|
          if recipe_tag.name == input_tag_name
            if !@recipes.include? recipe
              @recipes << recipe
            end
          end
        end
      end
    end
    @recipes
  end
end
