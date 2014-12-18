require 'spec_helper'

RSpec.describe Restaurant, :type => :model do 
	it 'is not valid with a name of less than three characters' do 
		restaurant = Restaurant.new(name: 'kf')
		expect(restaurant).to have(1).error_on(:name)
		expect(restaurant).not_to be_valid
	end

	it 'is not valid unless it has a unique name' do
		Restaurant.create(name: "Moe's Tavern")
		restaurant = Restaurant.new(name: "Moe's Tavern")
		expect(restaurant).to have(1).error_on(:name)
	end 

	describe '#average_rating' do 

		context 'no reviews' do 
			it 'returns "N/A" when there are no reviews' do 
				restaurant = Restaurant.create(name: "The Ivy")
				expect(restaurant.average_rating).to eq "N/A"
			end
		end

		context '1 review' do 
			it 'returns the rating' do
				restaurant = Restaurant.create(name: "The Ivy")
				restaurant.reviews.build(rating: 4)
				# might mention in class - use build not create
				# http://stackoverflow.com/questions/403671/the-differences-between-build-create-and-create-and-when-should-they-be-us
				expect(restaurant.average_rating).to eq 4
			end
		end

		context 'multiple reviews' do 
			it 'returns the average of the ratings' do 
				restaurant = Restaurant.create(name: "The Ivy")
				restaurant.reviews.build(rating: 1)
				restaurant.reviews.build(rating: 5)
				# expect(restaurant.average_rating).to eq 3<== true
				expect(restaurant.average_rating).to eq 6
			end
		end
	
	end



end

	# describe '#average_rating' do 
	# 	context 'no reviews' do 
	# 		it 'returns "N/A" when there are no reviews' do 
	# 			restaurant = Restaurant.create(name: "The Ivy")
	# 			expect(restaurant.average_rating).to eq "N/A"
	# 		end
	# 	end
	# end