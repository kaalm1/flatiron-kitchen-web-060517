class IngredientsController < ApplicationController


  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    Ingredient.find(params[:id]).update(ingredient_params)
    @ingredient = Ingredient.find(params[:id])
    redirect_to ingredient_path(@ingredient)
  end

  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end





  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
