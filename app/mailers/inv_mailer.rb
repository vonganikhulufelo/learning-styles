class InvMailer < ApplicationMailer
  default from: "foo@example.com"
  
  def invitation(invitation, url)
    mail(to: invitation.recipient_email,
      subject:    "Invitation")
    	@url = "http://localhost:3000"
    	invitation.update_attribute(:sent_at, Time.now)
  end

end
