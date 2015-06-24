class UsersController < ApplicationController
	 before_action :authenticate_user!

  def index
    # @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @food_places = @user.food_places.limit(3)
    # unless @user == current_user
    #   redirect_to :back, :alert => "Access denied."
    # end
  end
end
