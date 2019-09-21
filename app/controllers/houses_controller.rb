class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  def index
    @houses = House.geocoded
    @markers = @houses.map do |house|
      {
        lat: house.latitude,
        lng: house.longitude,
        infoWindow: render_to_string(partial: "info_window_house", locals: { house: house })
      }
    end
  end

  def show
    @house = House.find(params[:id])

    house_coordinates = {
      lat: @house.latitude,
      lng: @house.longitude,
      infoWindow: render_to_string(partial: "info_window_house", locals: { house: @house })
    }
    @markers = @house.restaurants["data"]["nearby"].map do |restaurant|
      {
        lat: restaurant["lat"].to_f,
        lng: restaurant["lng"].to_f,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
    @markers << house_coordinates
  end

  def contact

  end

  private

  def house_params
    params.require(:house).permit(:address, :postcode, :bedroom, :bathroom, :square_feet, :council_tax, :ptal, :green_belt, :restaurants, :area_id)
  end

  def set_house
    @house = House.find(params[:id])
  end
end
