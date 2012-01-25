class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  def index
    @meal = Meal.where(:id => params[:meal_id]).first
    @recipes = @meal.andand.recipes || Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @meal = Meal.find(params[:meal_id]) if params[:meal_id]
    @recipe = @meal.recipes.find(params[:id]) || Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @meal = Meal.find(params[:meal_id]) if params[:meal_id]
    @recipe = @meal ? @meal.recipes.build : Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    10.times { @recipe.ingredients.build }
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @meal = Meal.find(params[:meal_id]) if params[:meal_id]
    @recipe = @meal ? @meal.recipes.create(params[:recipe]) : Recipe.new(params[:recipe])

    @recipe.ingredients = params[:ingredients].map {|i| 
      Ingredient.new(:item => Food.find(i.delete(:item_id)), :quantity => i[:quantity]) unless i[:item_id].blank? 
    }.compact if params[:ingredients]

    @recipe.tags = params[:tags].split(/,/).map { |t|
      Tag.find_or_create_by_name(t.strip.downcase)
    }.compact if params[:tags]

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    @recipe.ingredients = params[:ingredients].map {|k, v| 
      ingredient = @recipe.ingredients.find(k) || @recipe.ingredients.build
      ingredient.update_attributes(:item => Food.find(v[:item_id]), :quantity => v[:quantity]) unless v[:item_id].blank?
      ingredient
    }.compact if params[:ingredients]

    @recipe.tags = params[:tags].split(/,/).map { |t|
      Tag.find_or_create_by_name(t.strip.downcase)
    }.compact if params[:tags]

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :ok }
    end
  end

end
