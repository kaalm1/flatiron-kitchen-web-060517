class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if !params[:recipe][:ingredients].nil?
      params[:recipe][:ingredients].each do |ingredient|
        @recipe.ingredients << Ingredient.find(ingredient)
      end
    end
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    Recipe.find(params[:id]).update(recipe_params)
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients = []
    if !params[:recipe][:ingredients].nil?
      params[:recipe][:ingredients].each do |ingredient|
        @recipe.ingredients << Ingredient.find(ingredient)
      end
    end
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name)
  end

end
