class LocationsController < ApplicationController
  def index
    @locations = policy_scope(Location)

    if params[:query].present?
      @locations = Location.where("address LIKE ?", "%#{params[:query]}%")
    else
      @locations = Location.all
    end

    # The `geocoded` scope filters only locations with coordinates
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: {location: location})
      }
    end
  end

  def show
    @location = Location.find(params[:id])
  end
end
