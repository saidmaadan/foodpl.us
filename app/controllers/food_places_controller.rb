class FoodPlacesController < ApplicationController
  before_action :set_food_place, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:search, :index, :show]
  before_action :check_user, only: [:edit, :update, :destroy]
 
  def search
    if params[:search].present?
      @food_places = FoodPlace.search(params[:search])
    else
      @food_places = FoodPlace.all.order("created_at DESC").page params[:page]
    end
    @reviews = Review.all.order("created_at DESC").limit(3)
  end
  # .page params[:page], per_page: 4
  # GET /food_places
  # GET /food_places.json
  def index 
    @food_places = FoodPlace.all.order("created_at DESC").limit(6)
  end

  # def all
  #   @food_places = FoodPlace.all.order("created_at DESC")
  # end
  # GET /food_places/1
  # GET /food_places/1.json
  def show
    @review = Review.new
    @review.food_place_id = @food_place_id
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    @reviews = Review.where(food_place_id: @food_place.id).order("created_at DESC").page params[:page]
    @food_places = FoodPlace.all.order("created_at DESC").limit(3)
  end
  

  # GET /food_places/new
  def new
    @food_place = FoodPlace.new
    @food_places = FoodPlace.all.order("created_at DESC").limit(3)
  end

  # GET /food_places/1/edit
  def edit
  end

  # POST /food_places
  # POST /food_places.json
  def create
    @food_place = FoodPlace.new(food_place_params)
    @food_place.user_id = current_user.id
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

    def check_user
      unless (@food_place.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_place_params
      params.require(:food_place).permit(:name, :address, :phone, :website, :about, :image)
    end
end

# def check_user
#       unless current_user.admin?
#         redirect_to root_url, alert: "Sorry, You are not authorized"
#       end
#     end
# , except: [:index, :show]
# except: [:index, :show]
