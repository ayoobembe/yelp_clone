class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy, autosave: true
	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
		reviews.inject(0) {|memo,review| memo + review.rating}
		# reviews.inject(0) {|memo,review| memo + review.rating}/reviews.count
		# return reviews.average(:rating)
		# return reviews.count
	end
end
