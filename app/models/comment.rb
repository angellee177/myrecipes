class Comment < ApplicationRecord
    # Association Many to Many with Recipe and Chef
    belongs_to :chef
    belongs_to :recipe

    # Validation for Chef and Recipe, that must exist
    validates :description, presence: true, length: {minimum: 4, maximum: 140}
    validates :chef_id, presence: true
    validates :recipe_id, presence: true

    # The latest recipe create, will be the first one to show up
    default_scope -> { order(updated_at: :desc) }

end