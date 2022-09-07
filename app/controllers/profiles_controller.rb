class ProfilesController < ApplicationController
  def index
    sleep 3
    @profiles = User.all

    if params[:query].present?

      if current_user.displaced
              @profiles = User.joins(:tags).where("tags.title ILIKE ? AND user.displaced ILIKE ? ", "%#{params[:query]}%", false)
      elsif current_user.displaced == false
              @profiles = User.joins(:tags).where("tags.title ILIKE ? AND user.displaced ILIKE ? ", "%#{params[:query]}%", true)
      else
        @profiles = User.all
      end
     else
       if current_user.displaced
                @profiles = User.joins(:tags).where("tags.title ILIKE ?", "%#{params[:query]}%")
        elsif current_user.displaced == false
                @profiles = User.joins(:tags).where("tags.title ILIKE ?", "%#{params[:query]}%")
        else
          @profiles = User.all
        end
      end
     
  end

  def show
    @profile = User.find(params[:id])
  end
end
