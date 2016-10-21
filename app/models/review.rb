class Review < ActiveRecord::Base
	# association
	belongs_to :user
	belongs_to :product
end
