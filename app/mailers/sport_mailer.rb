class SportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sport_mailer.post_created.subject
  #
  def post_created
    # @user = params[:user]
    # @sport = params[:sport]

    @greeting = "Hi"
  
    mail(
       from: "mansipawar517@gmail.com",
       to: User.last.email,
       cc: User.all.pluck(:email), 
       bcc: "ravi123@gmail.com", 
       subject: "new sport created"
      )
    # mail to: "to@example.org"

  end
end
