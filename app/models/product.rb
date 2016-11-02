class Product < ActiveRecord::Base
	# association
	belongs_to :user
	has_many :reviews
end
