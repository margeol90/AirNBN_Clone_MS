class ReviewsController < ApplicationController
  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end
end
