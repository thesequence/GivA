class LocationsController < ApplicationController
  def index
    @locations = policy_scope(Location)
    # The `geocoded` scope filters only locations with coordinates
    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: {location: location})
      }
    end

    if params[:query].present?
      @locations = Location.search_by_address_category(params[:query])
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end
end
