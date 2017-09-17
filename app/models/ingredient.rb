class Ingredient < ActiveRecord::Base
 belongs_to :recipe
 has_many :quantities

end
