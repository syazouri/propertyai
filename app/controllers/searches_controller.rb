class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_search, only: [:show]

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    @search.area_id = area_maths
    @search.save
    redirect_to areas_path
  end

  def show
    @search = Search.find(params[:id])
    @area = Area.all
    # @results = @area.map({area.name.CommuterTime})
  end

  def update
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:borrowing, :gross_annual, :deposit, :credit_score, :school, :distance_to_work, :user_id,:postcode)
  end

  # def Geocoding_area
  # end

  def area_maths
    area_name = distance_to_work
    preferred_area = Area.where(name: area_name)
    final_area = area_math_income(preferred_area)
    final_area.id
  end


  AREA_NAMES = %w(shoreditch lambeth wandsworth hackney camden)
  POSTCODE = %w(E27HE SW21EG  SW178TY EC1Y8ND NW33NT)
  AVERAGE_DEPOSIT = %w(105,051 82,405 63,540 71,013 92,097)
  # AVERAGE_DEPOSIT = Average income


  def distance_to_work
    distance_to_work = search_params[:distance_to_work]
    if distance_to_work.to_i < 18
      AREA_NAMES[3]
    elsif distance_to_work.to_i > 35
      AREA_NAMES[1]
    elsif distance_to_work.to_i > 30
      AREA_NAMES[2]
    elsif distance_to_work.to_i > 25
      AREA_NAMES[4]
    else distance_to_work.to_i > 18
      AREA_NAMES[0]
    end
  end

  def area_math_income(pref_area)
    return pref_area.first if search_params[:gross_annual] > AVERAGE_DEPOSIT
    Area.where(AVERAGE_DEPOSIT < search_params[:gross_annual]).first
  end

end
