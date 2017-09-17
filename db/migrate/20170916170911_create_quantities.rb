class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
  	create_table :quantities do |t|
  		t.integer :value
  		t.integer :ingredient_id

  		t.timestamps
  	end
  end
end
