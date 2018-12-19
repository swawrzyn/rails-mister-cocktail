class DosesController < ApplicationController
  before_action :set_cocktail, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_dose, only: [:edit, :update, :delete, :destroy]

  def index
    @doses = @cocktail.doses
  end

  def new
    @dose = Dose.new
    current_doses = @cocktail.doses.map { |dose| dose.ingredient.name }
    @ingredients = Ingredient.all.reject { |ing| current_doses.include?(ing.name) }.sort_by { |ing| ing.name }
    puts "ingredients #{@ingredients}"
    respond_to do |format|
      format.js {}
      format.html { render :new }
    end
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    respond_to do |format|
      if @dose.save
        @doses = @cocktail.doses
        format.js { }
      else
        current_doses = @cocktail.doses.map { |dose| dose.ingredient.name }
        @ingredients = Ingredient.all.reject { |ing| current_doses.include?(ing.name) }.sort_by { |ing| ing.name }
        format.js { render :new }
      end
    end
    
  end

  def edit
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @dose.update(dose_update_params)
    @doses = @cocktail.doses
    respond_to do |format|
      format.js { }
      format.html { redirect_to cocktail_path(@cocktail) }
    end
  end

  def delete; end

  def destroy
    @dose.destroy
    @doses = @cocktail.doses
    respond_to do |format|
      format.js { }
      format.html { redirect_to cocktail_path(@cocktail) }
    end
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
