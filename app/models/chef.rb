class Chef < ApplicationRecord
    before_save { self.email = email.downcase }
    
    # For Upload Photo
    has_one_attached :picture
    
    # Association One to Many between Chef and Recipes
    has_many :recipes, dependent: :destroy #to delete all associate recipes with Chef

    #Association many to many with Comment
    has_many :comments, dependent: :destroy 

    # Add Secure Password
    has_secure_password

    # Validation for Name
    validates :chef_name, presence: {messages:'Chef Name cannot be blank!'},
    length: {maximum:30, message:'Name Max. Length is 30 Character!'}
    
    # Validation For Email
    validates :email, presence: {messages:'Email cannot be blank!'},
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
    uniqueness: { case_sensitive: false }
    
    # Validation For Password
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true #allow us to not change our password

    def update_with_token!
        update_column(:token, generate_token)
    end

    private

    def generate_token
        SecureRandom.urlsafe_base64
    end

end