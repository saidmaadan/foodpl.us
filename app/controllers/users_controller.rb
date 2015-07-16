class UsersController < ApplicationController
	 before_action :authenticate_user!

  def index
    # @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
    @reviews = @user.reviews
    @food_places = @user.food_places.order("created_at DESC").page params[:page]
    # unless @user == current_user
    #   redirect_to :back, :alert => "Access denied."
    # end
  end
end
