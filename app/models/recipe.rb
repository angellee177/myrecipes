class Recipe < ApplicationRecord
    belongs_to :chef

    validates :name, presence: true,
    length: {maximum: 50}
    validates :description, presence: true,
    length:{in: 10..10000}
    validates :chef_id, presence:true
    
end