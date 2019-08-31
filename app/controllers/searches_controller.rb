class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]


  def index
    @areas = Area.all
  end

  def show
  end

  private

  def area_params
    params.require(:area).permit(:name, :sold_price, :schools, :crime, :demographics, :price, :growth, :demand)
  end

  def set_area
    @area = Area.find(params[:id])
  end
end
