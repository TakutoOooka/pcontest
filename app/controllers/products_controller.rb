class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :search

	def new
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		product = Product.find(params[:id])
		product.source_code = params[:source_code]
		product.save
	end

	def create
		Product.create(
			product_name: product_params[:product_name],
			source_code: product_params[:source_code],
			user_id: current_user.id,
			ave_rate: 0)
	end

	def destroy
		if Product.find(params[:id]).user_id == current_user.id
			product = Product.find(params[:id])
			product.destroy
		end
	end

	def show
		@product = Product.find(params[:id])
		@reviews = @product.reviews
	end

	def popular_products
		@products = Product.all.order("ave_rate DESC").page(params[:page]).per(2)
	end

	def fresh_products
		@products = Product.all.order("updated_at DESC").page(params[:page]).per(2)
	end

	def user_products(user_id)
		return Product.find_by(product_id: params[id]).page(params[:page]).per(2)
	end

	private
	def product_params
		params.permit(:source_code, :product_name)
	end
end
