class InviteMailer < ApplicationMailer

 def send_invite_team(invite)
    @invite = invite
    mail to: @invite.email, subject: "Invitation"
 end

end
