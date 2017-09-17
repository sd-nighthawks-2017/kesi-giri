class AddNamecolumn < ActiveRecord::Migration[5.1]
  def change
  	add_column(:recipes, :name, :string, null: false)
  end
end
