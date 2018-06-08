class TeaminvitesController < ApplicationController
  before_action :set_teaminvite, only: [:show, :edit, :update, :destroy]

  # GET /teaminvites
  # GET /teaminvites.json
  def index
    @team = Team.find(params[:team_id])
    @teaminvites = @team.teaminvites
  end

  # GET /teaminvites/1
  # GET /teaminvites/1.json
  def show
  end

  # GET /teaminvites/new
  def new
    @team = Team.find(params[:team_id])
    @teaminvite = @team.teaminvites.build
  end

  # GET /teaminvites/1/edit
  def edit
  end

  # POST /teaminvites
  # POST /teaminvites.json
  def create
    @team = Team.find(params[:team_id])
    @teaminvite = @team.teaminvites.create(teaminvite_params)

    @email = @teaminvite.email.split(',')
      @email.each do | email  | 
        @user = User.find_by_email(email)
        if @user
        @teaminvite.update_attribute(:user_id, @user.id)
        @teaminvite.update_attribute(:name, @user.name)
        @teaminvite.update_attribute(:organization_id, @team.organization_id)
        @teaminvite.update_attribute(:email, email)
        @teaminvite.update_attribute(:accepted, 'true')
        @teaminvite.save
        #InviteMailer.send_invite_team(@teaminvite).deliver_now
       end
      end

    redirect_to root_path
  end

  # PATCH/PUT /teaminvites/1
  # PATCH/PUT /teaminvites/1.json
  def update
    respond_to do |format|
      if @teaminvite.update(teaminvite_params)
        format.html { redirect_to @teaminvite, notice: 'Teaminvite was successfully updated.' }
        format.json { render :show, status: :ok, location: @teaminvite }
      else
        format.html { render :edit }
        format.json { render json: @teaminvite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaminvites/1
  # DELETE /teaminvites/1.json
  def destroy
    @teaminvite.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Teaminvite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teaminvite
      @teaminvite = Teaminvite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teaminvite_params
      params.require(:teaminvite).permit(:team_id, :email, :user_id)
    end
end
