class ReviewsController < ApplicationController
	def show
	end

	def create
		Review.create(
			rate: params[:rate],
			review: params[:review_text],
			user_id: current_user.id,
			product_id: params[:product_id]
		)
		product = Product.find(params[:product_id])
		sum = 0.0
		product.reviews.each do |review|
			sum += review.rate
		end
		ave = sum/product.reviews.count
		product.ave_rate = ave
		product.save
	end

	def edit
	end

	def update
	end

	def destroy
		if Review.find(params[:review_id]).user_id == current_user.id
			review = Review.find(params[:review_id])
			review.destroy
		end
	end

	def product_reviews(product_id)
	end

	def user_reviews(user_id)
	end
end
