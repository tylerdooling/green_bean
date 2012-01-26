class IngredientsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingredients }
    end
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @ingredient = Ingredient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/new
  # GET /ingredients/new.json
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredient }
    end
  end

  # GET /ingredients/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(:item => Food.find(params[:ingredient][:item_id]), :quantity => params[:ingredient][:quantity])

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully created.' }
        format.json { render json: @ingredient, status: :created, location: @ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredients/1
  # PUT /ingredients/1.json
  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    respond_to do |format|
      if @ingredient.update_attributes(:quantity => params[:ingredient][:quantity])
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :ok }
    end
  end
end
