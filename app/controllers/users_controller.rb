class UsersController < ApplicationController
	def show
		@show_user = User.find_by(id: params[:id])
		@user_products = @show_user.products.order("updated_at DESC").page(params[:page]).per(2)
	end
end
