class AddSlugToFoodPlaces < ActiveRecord::Migration
  def change
    add_column :food_places, :slug, :string
    add_index :food_places, :slug, unique: true
  end
end
