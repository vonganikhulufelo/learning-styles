class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.activated?
        log_in user
        if user.step_no.to_i < 0 || user.step_no == nil
          redirect_to new_learningstyle_path
        elsif user.step_no.to_i != 4
          redirect_to learningstyle_steps_path
        else
          redirect_to root_url
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
