class LocationsController < ApplicationController
  def create
    location = Location.new(location_params)

    if location.save
      render json: location
    else
      render json: { error_messages: location.errors.full_messages }
    end
  end

  def index
    locations = Location.all

    if locations
      render json: locations
    else
      render json: { message: 'Locations not found' }
    end
  end

  def show
    location = Location.find(params[:id])

    if location
      render json: location
    end

  rescue ActiveRecord::RecordNotFound
    render json: { error_messages: "Location not found." }
  end

  def update
    location = Location.find(params[:id])

    if location.update(location_params)
      render json: location
    else
      render json: { error_messages: location.errors.full_messages }
    end
  end

  def destroy
    location = Location.find(params[:id])

    if location.destroy
      render json: { message: 'Location deleted' }
    else
      render json: { error_messages: location.errors.full_messages }
    end
  end

  private

  def location_params
    @location_params ||=  params.require(:location).permit(
      :user_id,
      :name,
      :length,
      :volume,
    )
  end
end
