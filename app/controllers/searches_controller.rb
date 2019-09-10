class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  # before_action :set_search, only: [:show]

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    # @search.area_id = area_maths
    if @search.save
      redirect_to search_path(@search)
    else
      render :new
    end
  end

  def show
    @search = Search.find(params[:id])
    areas_match_distance = Area.near([@search.latitude, @search.longitude], @search.distance_to_work)

    # areas_match_price = areas_match_distance.where.AVERAGE_DEPOSIT

    # redirect_to area_path
    # @results = @area.map({area.name.CommuterTime})
    @areas = areas_match_distance.first(3)
  end

  def update
    @search = Search.find(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:gross_annual, :deposit, :school, :distance_to_work, :work_postcode, :user_id)
  end

  def area_maths
    area_name = distance_to_work
    preferred_area = Area.where(name: area_name)
    final_area = area_math_income(preferred_area)
    final_area.id
  end


  # AREA_NAMES = %w(shoreditch lambeth wandsworth hackney camden)
  # POSTCODE = %w(E27HE SW21EG  SW178TY EC1Y8ND NW33NT)
  # AVERAGE_DEPOSIT = [ 105051, 82405, 63540, 71013, 92097 ]
  # # AVERAGE_DEPOSIT = Average income
  # def distance_to_work
  #   distance_to_work = search_params[:distance_to_work].to_i
  #   if distance_to_work < 18
  #     AREA_NAMES[3]
  #   elsif distance_to_work > 35
  #     AREA_NAMES[1]
  #   elsif distance_to_work > 30
  #     AREA_NAMES[2]
  #   elsif distance_to_work > 25
  #     AREA_NAMES[4]
  #   else distance_to_work > 18
  #     AREA_NAMES[0]
  #   end
  # end

  # def area_math_income(pref_area)
  #   return pref_area.first if search_params[:gross_annual].to_i > AVERAGE_DEPOSIT
  #   Area.where(AVERAGE_DEPOSIT < search_params[:gross_annual]).first
  # end



  # #add in table avager table in areas,

  # def area_math_deposit(pref_area)
  #   return pref_area if search_params[:deposit] > pref_area.avg_deposit
  #   Area.where(avg_deposit: search_params[:deposit]).first
  # end
end
