class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "You created the recipe #{@recipe.name}!"
      redirect_to('/')
    else
      flash[:notice] = "Wrong wrong wrong. Try again."
      render('recipes/new.html.erb')
    end
  end

end
