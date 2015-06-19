class FoodPlacesController < ApplicationController
  before_action :set_food_place, only: [:show, :edit, :update, :destroy]

  # GET /food_places
  # GET /food_places.json
  def index
    @food_places = FoodPlace.all
  end

  # GET /food_places/1
  # GET /food_places/1.json
  def show
  end

  # GET /food_places/new
  def new
    @food_place = FoodPlace.new
  end

  # GET /food_places/1/edit
  def edit
  end

  # POST /food_places
  # POST /food_places.json
  def create
    @food_place = FoodPlace.new(food_place_params)

    respond_to do |format|
      if @food_place.save
        format.html { redirect_to @food_place, notice: 'Food place was successfully created.' }
        format.json { render :show, status: :created, location: @food_place }
      else
        format.html { render :new }
        format.json { render json: @food_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_places/1
  # PATCH/PUT /food_places/1.json
  def update
    respond_to do |format|
      if @food_place.update(food_place_params)
        format.html { redirect_to @food_place, notice: 'Food place was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_place }
      else
        format.html { render :edit }
        format.json { render json: @food_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_places/1
  # DELETE /food_places/1.json
  def destroy
    @food_place.destroy
    respond_to do |format|
      format.html { redirect_to food_places_url, notice: 'Food place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_place
      @food_place = FoodPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_place_params
      params.require(:food_place).permit(:name, :address, :phone, :website, :image)
    end
end
