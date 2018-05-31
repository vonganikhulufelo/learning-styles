class AcceptsController < ApplicationController
  
 def index




 end
  def show
  	@teaminvite = Teaminvite.find(params[:id])
  	if @teaminvite.accepted?
  		redirect_to root_path
  		flash.now[:success] = 'Accepted'
	  	else
	  	@teaminvite.update_attribute(:accepted, 'true')
	  	flash.now[:success] = 'Already accepted'
	  	redirect_to root_path
	 end
  end

  def create
      respond_to do | format |
      format.html { redirect_to accepts_path}
      format.json { }
    end
  end


end
