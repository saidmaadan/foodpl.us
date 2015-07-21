class ReviewMailer < ActionMailer::Base

	def review_created(current_user, food_place.user, comment)

		@current_user = current_user
		@food_place.user = food_place.user
		@comment = comment

		mail(to: food_place.user.email,
			from: "hr@foodpl.us",
			subject: "Review Created")
	end
end
