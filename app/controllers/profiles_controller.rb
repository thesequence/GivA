class ProfilesController < ApplicationController
  def index
    @profiles = policy_scope(User)
  end

  def show
    @profile = User.find(params[:id])
    # authorize @profile
  end

  def new
    @profile = User.new
    authorize @profile
  end

  def create
    
  end

end
