# Preview all emails at http://localhost:3000/rails/mailers/chef_mailer
class ChefMailerPreview < ActionMailer::Preview
    def send_forgot_password
        # Set up a temporary order for the preview
        chef = Chef.new(chef_name: "Joe Smith", email: "angellee17@yopmail.com")
    
        ChefMailer.with(chef: chef).send_forgot_password
    end
end
