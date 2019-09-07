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
  end

  def update
    @search = Search.find(params[:id])
    raise
  end

  private

  def search_params
    params.require(:search).permit(:borrowing, :gross_annual, :deposit, :credit_score, :school, :distance_to_work, :user_id)
    # postcode in the permitted params and the form
    # geocoding with radiums around the work place
    # will retrun arrays  of post code
    # area table - area.where[postcode] will return 2 postcode
    # see if they can afford the area
    # (this will should recommended of the area to live in)then compare the price in the area table with the amout they have inputed
    # area id closes to price becomes the area
    #
  end

  def Geocoding_area

  end

  def area_maths
    area_name = distance_to_work
    preferred_area = Area.where(name: area_name)
    final_area = area_math_deposit(preferred_area)
    final_area.id
    # - note to self make the calculation in this area
    # this will hold all the calculation methods and will set the priority
  end


  AREA_NAMES = %w(shoreditch lambeth wandsworth hackney camden)
  POSTCODE = %w(E27HE SW21EG  SW178TY EC1Y8ND NW33NT)
  def distance_to_work
    distance_to_work = search_params[:distance_to_work]
    if distance_to_work < 18
      AREA_NAMES[3]
    elsif distance_to_work > 18
      AREA_NAMES[0]
    elsif distance_to_work > 25
      AREA_NAMES[4]
    elsif distance_to_work > 30
      AREA_NAMES[2]
    else distance_to_work > 35
      AREA_NAMES[1]
    end
  end


    #add in table avager table in areas,

    def area_math_deposit(pref_area)
      return pref_area if search_params[:deposit] > pref_area.avg_deposit
      Area.where(avg_deposit: search_params[:deposit]).first
    end
  end
