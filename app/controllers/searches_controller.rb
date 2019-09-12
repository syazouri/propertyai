class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  # before_action :set_search, only: [:show]
  def index
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    session[:mortgage] = params["max-mortgage"]
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
    max_borrow = @search.deposit.to_i + session[:mortgage].to_i
    @areas = areas_match_distance.select { |area| max_borrow >= area.sold_price["data"]["average"] }
    @areas = @areas.sort_by { |area| area.sold_price["data"]["average"] }.reverse


    if @areas.count > 3
      @areas = @areas.first(3)
    elsif @areas.count <= 3 && @areas.count != 0
      @areas = @areas.first(@areas.count)
    else
      @areas = []
    end
    # @areas = @area.map({area.name.CommuterTime}) this may need to be houses
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
end
