class ProfilesController < ApplicationController
  def index
    sleep 3
    @profiles = User.all
    if params[:query].present?
      @profiles = User.joins(:tags).where("tags.title ILIKE ?", "%#{params[:query]}%")
      # @tags = Tag.where("address LIKE ?", "%#{params[:query]}%")
    else
      # @tags = Tag.all
      @profiles = User.all
    end
  end

  def show
    @profile = User.find(params[:id])
  end
end
