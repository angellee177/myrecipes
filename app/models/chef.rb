class Chef < ApplicationRecord
    before_save { self.email = email.downcase }

    has_many :recipes

    validates :chef_name, presence: {messages:'Chef Name cannot be blank!'},
    length: {maximum:30, message:'Name Max. Length is 30 Character!'}
    validates :email, presence: {messages:'Email cannot be blank!'},
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
    uniqueness: { case_sensitive: false }, 
end