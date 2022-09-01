class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.find(params[:user_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = @user
    if @review.save
      redirect_to user_reviews_path(@user)
    else
      render "new_user_review", status: :unprocessable_entity
    end
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  def review_params
    params.require(:review).permit(:content)
  end
end
