class ReviewsController < ApplicationController
  before_action :set_flat, only: %i[new create]

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.flat = @flat
    authorize @review
    if @review.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
