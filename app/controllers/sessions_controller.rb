class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user
        log_in user
        learning = user.learningstyles.find_by_user_id(user.id)
        if learning
        if user.learningstyles.find_by_user_id(user.id).completed_no == 80 
          redirect_to root_url
        else
          redirect_to edit_user_learningstyle_path(user.id, user.learningstyles.find_by_user_id(user.id).id)
        end
      else
        redirect_to new_user_learningstyle_path(user.id)
      end
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

   def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
    
end
