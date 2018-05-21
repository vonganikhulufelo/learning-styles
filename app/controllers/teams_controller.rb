class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @organization = Organization.find(params[:organization_id])
    @teams = @organization.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @org = Organization.find_by(org_name: params[:organization_id])
    @team = Team.find_by(id: params[:id])

    @teams = User.joins(organizations: [teams: :teaminvites]).select('teaminvites.name as name, teams.team_name as team_name,teams.id as team_id, organizations.org_name as org_name, teaminvites.admin, teaminvites.id as teaminvite_id').where("teaminvites.team_id = ? AND teaminvites.accepted = ?", @team.id, 'true').group('teaminvites.id, teams.id, organizations.id')
 
    @teamsmembers = User.joins(organizations: [teams: :teaminvites]).joins(:learningstyles).select('users.name,
     learningstyles.activisttotal, learningstyles.reflectortotal, learningstyles.theoristtotal, learningstyles.pragmatisttotal,
      learningstyles.actstatus, learningstyles.refstatus, learningstyles.theostatus,
       learningstyles.pragstatus').where("teaminvites.accepted = ? AND teams.id = ?", 'true', @team.id).group('users.id,teams.id,organizations.id, learningstyles.id')
  end

  # GET /teams/new
  def new
    @organization = Organization.find(params[:organization_id])
    @team = @organization.teams.build
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @organization = Organization.find(params[:organization_id])
    @team = @organization.teams.create(team_params)

    respond_to do |format|
      if @team.save

        Teaminvite.create!(admin_id: current_user.id,name: current_user.name,user_id: current_user.id, accepted: 'true', team_id: @team.id, email: current_user.email, admin: 'true',organization_id: @team.organization_id)
        format.html { redirect_to organization_teams_path(@team.organization_id), notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to organization_teams_path(@team.organization_id), notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @organization = Organization.find(params[:organization_id])
      @team = @organization.teams.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:team_name, :organization_id)
    end
end
