class AngerLogsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @anger_logs = current_user.anger_logs.order(created_at: :desc)
  end

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

  def edit
    @anger_log = current_user.anger_logs.find(params[:id])
  end

  def update
    @anger_log = current_user.anger_logs.find(params[:id])
    if @anger_log.update(anger_log_params)
      redirect_to anger_logs_path, success: '更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def anger_log_params
    params.require(:anger_log).permit(:occurrence_at, :place, :event, :thought, :anger_level, :review)
  end

end
