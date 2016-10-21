class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.text			:source_code
    	t.integer		:product_id
    	t.integer		:user_id
		t.timestamps
    end
  end
end
