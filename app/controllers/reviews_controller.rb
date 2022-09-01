class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:profile_id])
    @review = Review.new
    @review.user = @user
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = User.find(params[:profile_id])
    authorize @review
    if @review.save!
      redirect_to new_profile_review_path(:profile_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
