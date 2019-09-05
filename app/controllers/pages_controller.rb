class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def profile
    @income = current_user.income
    @credit = current_user.credit_score
    @dob = current_user.date_of_birth
    @deposit = current_user.deposit
    @borrowing = current_user.borrowing
  end


end
