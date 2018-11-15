class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @reviews = Review.where(cocktail: @cocktail).reverse
    @review = Review.new
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def create
    # @dose = Dose.new(cocktail_params[:doses_attributes]['0'])
    # @dose.cocktail = @cocktail
    # @dose.save
    redirect_to cocktail_path(Cocktail.create(cocktail_params))
  end

  def edit; end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, doses_attributes: [:ingredient_id, :description])
  end
end
