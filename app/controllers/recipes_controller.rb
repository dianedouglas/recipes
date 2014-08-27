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

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      flash[:notice] = "Recipe updated."
      redirect_to('/')
    else
      flash[:notice] = "Geez. Try again."
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to('/')
  end

end
