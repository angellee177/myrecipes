class Recipe < ApplicationRecord
    belongs_to :chef

    validates :name, presence: {message: 'Recipes Name cannot be blank!'},
    length: {maximum: 25, message:'Name Max. Length is 50 Character!'}
    validates :description, presence: {message: 'Recipes Description cannot be blank!'},
    length:{in: 10..10000, message: 'Description must have Min. 10 character and Max. 10.000  character'}
    validates :chef_id, presence: {message: 'Recipes must have Chef!'}
end