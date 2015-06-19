class AddImageToFoodPlaces < ActiveRecord::Migration
  def change
    add_column :food_places, :image, :string
  end
end
