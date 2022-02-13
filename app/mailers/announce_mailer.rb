class AnnounceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.announce_mailer.Announcement_created.subject
  #
  def Announcement_created
    @greeting = "Hi"

    mail to: User.where(sport_id:3).pluck(:email)
    
  end
end