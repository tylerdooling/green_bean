class ScheduledMealsController < ApplicationController
  def index
    @current_week = params[:current_week].andand.to_i || (Date.today.cweek-1)
    @dates = meals_in_week @current_week

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  def meals_in_week(week)
    first_day_of_week = week.weeks.since(Time.local(Time.now.year))
    @dates = (0..6).to_a.inject({}) do |r, n| 
      r.merge({ day = (first_day_of_week + n.day) => ScheduledMeal.find_all_by_meal_date(day).map { |sm| sm.meal }}) 
    end
    @dates
  end

  def shopping_list
    week = params[:current_week]
    week ||= Date.today.cweek - 1
    @week = week.to_i
    @first_day_of_week = @week.weeks.since(Time.local(Time.now.year)).to_date
    @shopping_list = ScheduledMeal.by_week(@week).inject({}) { |hash, sm| hash.merge(sm.shopping_list) { |k, o, n| o + n } }.sort
  end

  def new
    @scheduled_meal = ScheduledMeal.new
    @scheduled_meal.meal_date = Time.parse(params[:meal_date]) if params[:meal_date]
    @scheduled_meal.meal = Meal.find(params[:meal_id]) if params[:meal_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  def show
  end

  def edit
    @scheduled_meal = ScheduledMeal.find(params[:id])
  end

  def create
    @scheduled_meal = ScheduledMeal.new(params[:scheduled_meal])

     respond_to do |format|
      if @scheduled_meal.save
        format.html { redirect_to scheduled_meals_path, notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @scheduled_meal = ScheduledMeal.find(params[:id])

    respond_to do |format|
      if @scheduled_meal.update_attributes(params[:scheduled_meal])
        format.html { redirect_to scheduled_meals_path, notice: 'Food was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def select_meal
    @meal_date = params[:meal_date]
    @meals = Meal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end


end
