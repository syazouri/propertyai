class HousesController < ApplicationController
def index
    @houses = House.all
  end

  def show
  end

  private

  def house_params
    params.require(:house).permit(:address, :postcode, :bedroom, :bathroom, :square_feet, :council_tax, :ptal, :green_belt, :restaurants, :area_id)
  end

  def set_house
    @house = House.find(params[:id])
  end
end
