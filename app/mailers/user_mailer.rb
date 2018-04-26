class UserMailer < ActionMailer::Base
    default from: "from@example.com"
  
    def account_activation
        @user = user
        mail to: user.email, subject: "Account activation"    
    end

    def password_reset
        @greeting = "Hi"
        mail to: "to@example.org"
    end
  end
  