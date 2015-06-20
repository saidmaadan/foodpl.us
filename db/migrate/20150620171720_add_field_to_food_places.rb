class AddFieldToFoodPlaces < ActiveRecord::Migration
  def change
    add_column :food_places, :about, :text
  end
end
