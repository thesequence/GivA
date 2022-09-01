class ReviewsController < ApplicationController
  def new
    @buddy = Buddy.find(params[:buddy_id])
    @review = Review.new
    @review.buddy = @buddy
    @review.user = current_user
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.buddy = Buddy.find(params[:buddy_id])
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to buddy_path(@review.buddy)
    else
     render :new, status: :unprocessable_entity
   end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
