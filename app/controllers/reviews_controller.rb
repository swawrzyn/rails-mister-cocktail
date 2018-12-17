class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    
    respond_to do |format|
      if @review.save
        @reviews = @cocktail.reviews.reverse
        format.js { }
        format.html { redirect_to cocktail_path(params[:cocktail_id]) }
      else
        format.html { redirect_to cocktail_path(params[:cocktail_id]) }
      end
    end
    
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
