class UserMailer < ActionMailer::Base
  default from: "stormy-escarpment-3556.herokuapp.com"
  def welcome_email(user)
    @user = user
    @url  = "http://stormy-escarpment-3556.herokuapp.com/signin"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
