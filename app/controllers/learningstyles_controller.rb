class LearningstylesController < ApplicationController
  before_action :set_learningstyle, only: [:show, :edit, :update, :destroy]

  # GET /learningstyles
  # GET /learningstyles.json
  def index
     @teamsmembers = User.joins(organizations: [teams: :teaminvites]).joins(:learningstyles).select('users.name, learningstyles.activisttotal, learningstyles.reflectortotal, 
      learningstyles.theoristtotal, learningstyles.pragmatisttotal, learningstyles.actstatus, learningstyles.refstatus,
      learningstyles.theostatus, learningstyles.pragstatus').where("teaminvites.user_id = ? AND teams.team_name != ?", current_user.id, ' ').group('users.id, learningstyles.id')
    @learningstyles = Learningstyle.all
  end

  # GET /learningstyles/1
  # GET /learningstyles/1.json
  def show
    @user = User.find(params[:user_id])
    @learningstyles = @user.learningstyles.find(@user.id)
    @name = Daru::Vector.new [@user.name]
    @activist = Daru::Vector.new [@learningstyles.activisttotal]
    @reflector = Daru::Vector.new [@learningstyles.reflectortotal]
    @theorist = Daru::Vector.new [@learningstyles.theoristtotal]
    @pragmatist = Daru::Vector.new [@learningstyles.pragmatisttotal]
  end

  # GET /learningstyles/new
  def new
    @learningstyle = Learningstyle.new
  end

  # GET /learningstyles/1/edit
  def edit
  end

  # POST /learningstyles
  # POST /learningstyles.json
  def create
    @learningstyle = Learningstyle.new(learningstyle_params)
    if current_user.step_no.to_i >= 1
      redirect_to learningstyle_steps_path
    else
    respond_to do |format|
      if @learningstyle.save
        @user = User.find(@learningstyle.user_id)
        @user.update_attribute(:step_no, 1)
        format.html { redirect_to learningstyle_steps_path, notice: 'Learningstyle was successfully created.' }
        format.json { render :show, status: :created, location: @learningstyle }
      else
        format.html { render :new }
        format.json { render json: @learningstyle.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /learningstyles/1
  # PATCH/PUT /learningstyles/1.json
  def update
    respond_to do |format|
      if @learningstyle.update(learningstyle_params)
        format.html { redirect_to @learningstyle, notice: 'Learningstyle was successfully updated.' }
        format.json { render :show, status: :ok, location: @learningstyle }
      else
        format.html { render :edit }
        format.json { render json: @learningstyle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learningstyles/1
  # DELETE /learningstyles/1.json
  def destroy
    @learningstyle.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Learningstyle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learningstyle
      @learningstyle = Learningstyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learningstyle_params
      params.require(:learningstyle).permit(:fname, :lname, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12, :question13, :question14, :question15, :question16, :question17, :question18, :question19, :question20, :question21, :question22, :question23, :question24, :question25, :question26, :question27, :question28, :question29, :question30, :question31, :question32, :question33, :question34, :question35, :question36, :question37, :question38, :question39, :question40, :question41, :question42, :question43, :question44, :question45, :question46, :question47, :question48, :question49, :question50, :question51, :question52, :question53, :question54, :question55, :question56, :question57, :question58, :question59, :question60, :question61, :question62, :question63, :question64, :question65, :question66, :question67, :question68, :question69, :question70, :question71, :question72, :question73, :question74, :question75, :question76, :question77, :question78, :question79, :question80, :activisttotal, :reflectortotal, :theoristtotal, :pragmatisttotal, :actstatus, :refstatus, :theostatus, :pragstatus, :user_id)
    end
end
