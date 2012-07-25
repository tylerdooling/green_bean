class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  before_filter :load_recipe, :except => [:index, :filter, :new, :create]

  respond_to :html, :json
  def index
    @meal = Meal.where(:id => params[:meal_id]).first
    @recipes = @meal.andand.recipes || Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def filter
    # TODO move to model
    @recipe_type = params[:recipe_type]
    @recipes = Recipe.find_all_by_recipe_type(@recipe_type)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @meal = Meal.find(params[:meal_id]) if params[:meal_id]
    @recipe = @meal.recipes.find(params[:id]) if @meal

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
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @meal = Meal.find(params[:meal_id]) if params[:meal_id]
    @recipe = @meal ? @meal.recipes.create(params[:recipe]) : Recipe.new(params[:recipe])

    #@recipe.ingredients = params[:ingredients].map {|i| 
      #Ingredient.new(:item => Food.find(i.delete(:item_id)), :quantity => i[:quantity]) unless i[:item_id].blank? 
    #}.compact if params[:ingredients]

    @recipe.tags = params[:tags].split(/,/).map { |t|
      Tag.find_or_create_by_name(t.strip.downcase)
    }.compact if params[:tags]

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe}
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

    #@recipe.ingredients = params[:recipe_ingredients].map {|k, v|
      #ingredient = @recipe.ingredients.find(k) || @recipe.ingredients.build
      #ingredient.update_attributes(:item => Food.find(v[:item_id]), :quantity => v[:quantity]) unless v[:item_id].blank?
      #ingredient
    #}.compact if params[:ingredients]

    @recipe.tags = params[:tags].split(/,/).map { |t|
      Tag.find_or_create_by_name(t.strip.downcase)
    }.compact if params[:tags]

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe }
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
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :ok }
    end
  end

  def add_ingredient
    @ingredients = Ingredient.find_all_by_food_group(params[:food_group]) if params[:food_group]
    @ingredients ||= Ingredient.all

    respond_with @ingredients
  end

  def edit_recipe_ingredient
    @recipe_ingredient = @recipe.recipe_ingredients.where(:id => params[:recipe_ingredient_id]).first

    respond_with @recipe_ingredient
  end

  def update_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:recipe_ingredient_id])
    @recipe_ingredient.update_attributes(params[:recipe_ingredient])

    respond_with @recipe
  end


  private
  def load_recipe
    @recipe = Recipe.find(params[:id] || params[:recipe_id])
  end

end
