class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_area, only: [:show, :edit, :update]

  def index
    @areas = Area.all

    # @area = Area.where(user_id: current_user.id).last.area

  end

  def show
    @schools = @area["schools"]["data"]["state"]["nearest"].map { |url| url["postcode"]}

     @markers = @schools.map do |postcode|
      results = Geocoder.search(postcode)
       { lat: results.first.coordinates[0], lng: results.first.coordinates[1]}
    end
    raise
  end

  def edit
  end

  def geocode
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
  end

  def update
    if @area.update(area_params)
      redirect_to area_path(@area), notice: "#{@area.name} was successfully updated."
    else
      render :edit
    end
  end

  private

  def area_params
    params.require(:area).permit(:name, :sold_price, :schools, :crime, :demographics, :price, :growth, :demand)
  end

  def set_area
    @area = Area.find(params[:id])
  end
end
