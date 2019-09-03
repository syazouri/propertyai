class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_search, only: [:show]

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:borrowing, :gross_annual, :deposit, :credit_score, :school, :distance_to_work)
  end
end
# @borrowing = current_user.borrowing
#    @gross_annual = current_user.gross_annual
#    @deposit = current_user.borrowing
#    @credit_score = current_user.credit_score
#    @school = current_user.school
#    @distance_to_work = current_user.distance_to_work
