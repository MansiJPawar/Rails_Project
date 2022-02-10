# Preview all emails at http://localhost:3000/rails/mailers/sport_mailer
class SportMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sport_mailer/post_created
  def post_created
    # SportMailer.with(user: User.last, post: Post.last).post_created
    SportMailer.post_created
  end

end
