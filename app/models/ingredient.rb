class Ingredient < ApplicationRecord
    has_many :recipe_ingredient
    has_many :recipes, through: :recipe_ingredient
    validates :name, presence: true, length: { minimum: 3, maximum: 25}
    validates_uniqueness_of :name
end