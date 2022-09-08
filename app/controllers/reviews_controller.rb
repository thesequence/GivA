class ReviewsController < ApplicationController
  def new
    # @user = User.find(params[:buddy_id])
    @buddy = Buddy.find(params[:buddy_id])
    @review = Review.new
    # @review.buddy = @buddy
    # @review.user = current_user
  end

  def create
    @review = Review.new(review_params)
    @buddy = Buddy.find(params[:buddy_id])
    @review.buddy = @buddy
    if @buddy.asker_id == current_user.id
      @review.user = User.find(@buddy.receiver_id)
    else
      @review.user = User.find(@buddy.asker_id)
    end

    if @review.save
      redirect_to buddies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
