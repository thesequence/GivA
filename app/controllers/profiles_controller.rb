class ProfilesController < ApplicationController
  def index
    sleep 3
    @profiles = policy_scope(User)
  end

  def show
    @profile = User.find(params[:id])
    # authorize @profile
  end
end
