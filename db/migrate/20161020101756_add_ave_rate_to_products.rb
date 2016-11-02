class AddAveRateToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :ave_rate, :integer, :after => :user_id
  	add_column :products, :product_name, :text, :after => :id
  	remove_column :products, :product_id, :integer
  end
end
