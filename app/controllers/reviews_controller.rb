class ReviewsController < ApplicationController
#how do those link_to helpers know where to look/how are they made

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.reviews.create(review_params)
		redirect_to restaurants_path
	end

	def review_params
		params.require(:review).permit(:thoughts, :rating)
	end
	

end
