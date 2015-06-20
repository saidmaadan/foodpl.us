class AddUserIdToFoodPlaces < ActiveRecord::Migration
  def change
    add_column :food_places, :user_id, :integer
  end
end
