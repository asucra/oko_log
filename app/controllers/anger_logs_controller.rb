class AngerLogsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @anger_log = AngerLog.new
  end

  def create
    @anger_log = current_user.anger_logs.build(anger_log_params)
    if @anger_log.save
      redirect_to anger_logs_path, success: '記録しました'
    else
      flash.now[:danger] =  '記録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def anger_log_params
    params.require(:anger_log).permit(:occurrence_at, :place, :event, :thought, :anger_level, :review)
  end

end
