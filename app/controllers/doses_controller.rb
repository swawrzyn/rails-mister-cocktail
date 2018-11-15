class DosesController < ApplicationController
  before_action :set_cocktail, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_dose, only: [:edit, :update, :delete, :destroy]

  def index
    @doses = @cocktail.doses
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit; end

  def update
    @dose.update(dose_update_params)
    redirect_to cocktail_path(@cocktail)
  end

  def delete; end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def dose_update_params
    params.require(:dose).permit(:description)
  end

end
