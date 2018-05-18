class AcceptInvitationsController < ApplicationController
  def accepted
  	@teaminvite = Teaminvite.find(params[:id])
  end
end
