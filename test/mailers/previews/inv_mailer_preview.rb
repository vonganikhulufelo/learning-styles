# Preview all emails at http://localhost:3000/rails/mailers/inv_mailer
class InvMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inv_mailer/invitation
  def invitation
    InvMailer.invitation
  end

end
