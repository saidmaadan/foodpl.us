class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :food_place
end
