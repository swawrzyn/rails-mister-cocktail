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
    respond_to do |format|
      format.js {}
      format.html { render 'show' }
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created!' }
      else
        format.html { render :new }
      end
    end
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
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
