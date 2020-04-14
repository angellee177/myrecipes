class ChefMailer < ApplicationMailer
    def send_forgot_password
        @chef = params[:chef]
        mail to: @chef.email, from: "leexiao62@gmail.com", subject: "Please reset your password"
    end  
end
