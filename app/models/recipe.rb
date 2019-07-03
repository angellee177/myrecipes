class Recipe < ApplicationRecord
    belongs_to :chef
    has_many :recipe_ingredients

    validates :name, presence: true,
    length: {maximum: 50}
    validates :description, presence: true,
    length:{in: 10..10000}
    validates :chef_id, presence:true
    
    default_scope -> { order(updated_at: :desc) }

end