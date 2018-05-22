class LearningstyleStepsController < ApplicationController
include Wicked::Wizard
  steps :learningstyle2, :learningstyle3, :learningstyle4
  
  def show
      @user = current_user
    case step
      
        when :learningstyle2
          if @user.step_no == 1
            @learningstyle = @user.learningstyles.find(@user.id)
          else
            skip_step
          end
        end

    case step
      
        when :learningstyle3
          if @user.step_no == 2
            @learningstyle = @user.learningstyles.find(@user.id)
          else
            skip_step
          end
        end
        case step
      
        when :learningstyle4
          if @user.step_no == 3
            @learningstyle = @user.learningstyles.find(@user.id)
          else
            skip_step
          end
        end

        render_wizard
  end

  def update
  	@user = current_user
  	@learningstyle = @user.learningstyles.order(:id).first
  	@learningstyle.update(learningstyle_params)
    
    @u = @user.step_no + 1
    @user.update_attribute(:step_no, @u)
  	render_wizard @learningstyle
  end

  private

  def learningstyle_params
      params.require(:learningstyle).permit(:fname, :lname, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12, :question13, :question14, :question15, :question16, :question17, :question18, :question19, :question20, :question21, :question22, :question23, :question24, :question25, :question26, :question27, :question28, :question29, :question30, :question31, :question32, :question33, :question34, :question35, :question36, :question37, :question38, :question39, :question40, :question41, :question42, :question43, :question44, :question45, :question46, :question47, :question48, :question49, :question50, :question51, :question52, :question53, :question54, :question55, :question56, :question57, :question58, :question59, :question60, :question61, :question62, :question63, :question64, :question65, :question66, :question67, :question68, :question69, :question70, :question71, :question72, :question73, :question74, :question75, :question76, :question77, :question78, :question79, :question80, :activisttotal, :reflectortotal, :theoristtotal, :pragmatisttotal, :actstatus, :refstatus, :theostatus, :pragstatus, :user_id)
   end


  def finish_wizard_path
    root_path
  end
end
