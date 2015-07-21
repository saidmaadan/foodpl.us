class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_food_place
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  # respond_to :html
  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.food_place_id = @food_place.id
    respond_to do |format|
      if @review.save
        ReviewMailer.review_created(current_user, @food_place.user, @review.comment).deliver
        format.html { redirect_to @food_place, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to food_place_path(@food_place), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to food_place_path(@food_place), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_food_place
      @food_place = FoodPlace.friendly.find(params[:food_place_id])
    end

    def check_user
      unless (@review.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else"
      end
    end


    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
