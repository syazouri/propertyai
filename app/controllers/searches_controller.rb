class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_search, only: [:show]

  def new
    @search = Search.new
  end
  def create
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    @search.area_id = Area.all.first.id
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

  def area_maths(values)

    if distance_to_work == rchoice1
      "recommended EC1Y8ND #{hackney}"
    elsif area_math_credit
      recommended = (EC1Y8ND - hackney)
    else area_math_deposit
      # - note to self make the calculation in this area
      # this will hold all the calculation methods and will set the priority
    end


    AREA_NAMES = %w(shoreditch lambeth wandsworth hackney camden)
    POSTCODE = %w(E27HE SW21EG  SW178TY EC1Y8ND NW33NT)
    def distance_to_work
      if distance_to_work < 18
        rchoice1 = postcode[3]
      elsif distance_to_work > 18
        postcode[0]
      elsif distance_to_work > 25
        postcode[4]
      elsif distance_to_work > 30
        postcode[2]
      else distance_to_work > 35
        postcode[1]
      end

      def area_math_credit < 650 ? "poor credit rating" : "Good credit rating"

        rating = (area_math_credit < 650 ? "poor credit rating" : "Good credit rating");


        def area_math_deposit
          if area_math_deposit > 40000
            postcode[3, 0, 4].sample
          elsif area_math_deposit < 20000
            postcode[1]
          else distance_to_work < 10000
            postcode[0]
          end
        end
