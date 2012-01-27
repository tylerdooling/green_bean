class ScheduledMealsController < ApplicationController
  def index
    first_day_of_week = (Date.today.cweek-1).weeks.since(Time.local(Time.now.year))
    @dates = (0..6).to_a.inject({}) do |r, n| 
      r.merge({ day = (first_day_of_week + n.day) => Meal.find_all_by_scheduled_date(day)}) 
    end

    puts @dates

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

end
