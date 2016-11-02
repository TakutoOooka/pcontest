class TopController < ApplicationController
	def index
		unless user_signed_in?
			redirect_to :new_user_session
		end
		@popular_products = Product.all.order("ave_rate DESC").limit(4)
		@fresh_products = Product.all.order("updated_at DESC").limit(4)
	end
end
