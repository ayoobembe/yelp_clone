class EndorsementsController < ApplicationController

	def create
		@review = Review.find(params[:review_id])
		@review.endorsements.create
		redirect_to restaurants_path #what does this mean?
	end
	
end
