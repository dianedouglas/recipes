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
    input_tags = params[:tag]["name"].split(", ")
    input_tags.each do |tag_name|
      @tag = Tag.create({name: tag_name})
      @recipe.tags << @tag
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
    input_tags = params[:tag]["name"].split(", ")

    @recipe.tags.each do |tag|
      tag.destroy
    end

    input_tags.each do |tag_name|
      @recipe.tags << Tag.create({name: tag_name})
    end

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to('/')
  end

  def droptag
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag_id])
    @recipe.tags.delete(@tag)
    redirect_to("/recipes/#{@recipe.id}")
  end

end
