class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy, :invitation_token]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    
    respond_to do | format |
      format.html
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = current_user
     @learningstyles = @user.learningstyles.order(:id).first
    @name = Daru::Vector.new [@user.name]
    @activist = Daru::Vector.new [@learningstyles.activisttotal]
    @reflector = Daru::Vector.new [@learningstyles.reflectortotal]
    @theorist = Daru::Vector.new [@learningstyles.theoristtotal]
    @pragmatist = Daru::Vector.new [@learningstyles.pragmatisttotal]
   
     @organizations = @user.organizations
     @users = User.find_by_sql("select * from users")
      @teams = User.joins(organizations: [teams: :teaminvites]).select('teams.team_name as team_name,teams.id as team_id, organizations.org_name as org_name, teaminvites.admin').where("teaminvites.user_id = ? AND teaminvites.accepted = ?", current_user.id, 'true').group('teaminvites.id, teams.id, organizations.id')
  end

  # GET /users/new
  def new
    @user = User.new
   # @user.email = @user.invitation.recipient_email if @user.invitation
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    if @user.save
       @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render :action => 'new.html.erb'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: 'User was successfully updated.' }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :action =>  'edit.html.erb' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
