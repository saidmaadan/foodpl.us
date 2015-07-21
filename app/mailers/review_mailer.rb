class ReviewMailer < ActionMailer::Base

	def review_created(current_user, food_place_user, comment)

		@current_user = current_user
		@food_place_user =food_place_user
		@comment = comment

		mail(to: food_place_user.email,
			from: "hr@foodpl.us",
			subject: "Review Created")
	end
end
