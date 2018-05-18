class AccountActivationsController < ApplicationController
	def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      if user.activated == 'true'
        flash[:danger] = "Account already activated!"
      redirect_to root_url
      else
      user.activate
      flash[:success] = "Account activated!"
      redirect_to root_url
    end
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
