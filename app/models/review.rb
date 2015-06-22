class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :food_place

	paginates_per 50
	max_paginates_per 50

	validates :rating, :comment, presence: true
	validates :rating, numericality:{ 
		only_integer: true,
		greater_than_or_equal_to: 1,
		less_than_or_equal_to: 5,
		message: "Accept only a whole number between 1 and 5"
	}
end
