class AddFoodPlaceIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :food_place_id, :integer
  end
end
