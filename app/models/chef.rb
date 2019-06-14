class Chef < ApplicationRecord
    before_save { self.email = email.downcase }

    # Association One to Many between Chef and Recipes
    has_many :recipes

    # Add Secure Password
    has_secure_password

    validates :chef_name, presence: {messages:'Chef Name cannot be blank!'},
    length: {maximum:30, message:'Name Max. Length is 30 Character!'}
    validates :email, presence: {messages:'Email cannot be blank!'},
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true #allow us to not change our password

end