class DosesController < ApplicationController
  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new({cocktail: @cocktail})
  end

  def create
    # raise
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    # raise
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
