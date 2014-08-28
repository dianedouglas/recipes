class RatingsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:id])
    @rating = Rating.create({rating: params[:rating]})
    @recipe.ratings << @rating
    redirect_to("/recipes/#{@recipe.id}")
  end

end
