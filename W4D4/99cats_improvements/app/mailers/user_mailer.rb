class UserMailer < ApplicationMailer
  default from: "App Academy <everybody@appacademy.io>"

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: 'sethborden1@gmail.com', subject: 'Welcome to Kitty Hell!')
  end


end
