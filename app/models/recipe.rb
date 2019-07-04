class Recipe < ApplicationRecord
    belongs_to :chef
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    # Associaton with comments
    has_many :comments, dependent: :destroy

    validates :name, presence: true,
    length: {maximum: 50}
    validates :description, presence: true,
    length:{in: 10..10000}
    validates :chef_id, presence:true
    
    # The latest recipe create, will be the first one to show up
    default_scope -> { order(updated_at: :desc) }

end