class AreasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_area, only: [:show, :edit, :update]

  def index
    @areas = Area.all
    #@areas = Search.where(user_id: current_user.id).last.areas
  end

  def show
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
