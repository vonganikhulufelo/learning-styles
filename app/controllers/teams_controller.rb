class TeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @organization = Organization.find(params[:organization_id])
    @@organization = @organization
    @teams = @organization.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @org = Organization.find(params[:organization_id])
    @team = @org.teams.find_by(id: params[:id])
    @teamsmembers = User.joins(organizations: [teams: :teaminvites]).joins(:learningstyles).select('teaminvites.name,teaminvites.email, teaminvites.user_id,teams.team_name
      ,learningstyles.id as learningstyle_id, teaminvites.admin').where("teaminvites.accepted = ? AND teaminvites.team_id = ?", 'true', @team.id).group('teaminvites.id,teams.id,learningstyles.id')
    @namearray = []
    @activistarray = []
    @refelctorarray = []
    @theroistarray = []
    @pragarray = []

    @teamsmembers.each do |member| 
      @user = User.find(member.user_id)
      @learningstyles = @user.learningstyles.find_by_user_id(@user.id)
      @namearray.push(@user.name)
      @activistarray.push(@learningstyles.activisttotal)
      @refelctorarray.push(@learningstyles.reflectortotal)
      @theroistarray.push(@learningstyles.theoristtotal)
      @pragarray.push(@learningstyles.pragmatisttotal)
    end

    @name = Daru::Vector.new(@namearray)
    @activist = Daru::Vector.new(@activistarray)
    @reflector = Daru::Vector.new(@refelctorarray)
    @theorist = Daru::Vector.new(@theroistarray)
    @prag = Daru::Vector.new(@pragarray)


  @data_frame = Daru::DataFrame.new(
  {
    'name' => @name,
    'activist' => @activist,
    'reflector' => @reflector,
    'theorist' => @theorist,
    'pragmatist' => @prag
  },
)
    #@learningstyles = @user.learningstyles.find_by(user_id: @user.id)
    #@name = Daru::Vector.new [@user.name]
    #@activist = Daru::Vector.new [@learningstyles.activisttotal]
    #@reflector = Daru::Vector.new [@learningstyles.reflectortotal]
    #@theorist = Daru::Vector.new [@learningstyles.theoristtotal]
    #@pragmatist = Daru::Vector.new [@learningstyles.pragmatisttotal]

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
      format.html { redirect_to team_url, notice: 'Itemm was successfully removed.' }   
      format.json { head :no_content }   
      format.js   { render :layout => false }   
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
