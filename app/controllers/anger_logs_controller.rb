class AngerLogsController < ApplicationController
  
  def index
    @anger_logs = current_user.anger_logs.includes(:tags).order(created_at: :desc)
  end

  def new
    @anger_log = AngerLog.new
  end

  def create
    @anger_log = current_user.anger_logs.build(anger_log_params)
    if @anger_log.save_with_tags(tag_names: get_unique_tag_names)
      redirect_to anger_logs_path, success: '記録しました'
    else
      flash.now[:danger] =  '記録に失敗しました'
      render :new
    end
  end

  def edit
    @anger_log = current_user.anger_logs.find(params[:id])
  end

  def update
    @anger_log = current_user.anger_logs.find(params[:id])
    @anger_log.assign_attributes(anger_log_params)
    if @anger_log.save_with_tags(tag_names: get_unique_tag_names)
      redirect_to anger_logs_path, success: '更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @anger_log = current_user.anger_logs.find(params[:id])
    @anger_log.destroy!
    redirect_to anger_logs_path, success: '削除しました', status: :see_other

  end

  private

  def anger_log_params
    params.require(:anger_log).permit(:occurrence_at, :place, :event, :thought, :anger_level, :review)
  end

  def get_unique_tag_names
    params.dig(:anger_log, :tag_names).split(',').uniq || []
  end

end
