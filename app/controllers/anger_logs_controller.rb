class AngerLogsController < ApplicationController
  def index
    @anger_logs = current_user.anger_logs.includes(:tags, :emotions).order(occurrence_at: :desc)
  end

  def new
    @anger_log = AngerLog.new
  end

  def create
    @anger_log = current_user.anger_logs.build(anger_log_params)
    if @anger_log.save_with_tags_and_emotions(tag_names: get_unique_tag_names, emotion_names: get_unique_emotion_names)
      redirect_to anger_logs_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @anger_log = current_user.anger_logs.find(params[:id])
  end

  def update
    @anger_log = current_user.anger_logs.find(params[:id])
    @anger_log.assign_attributes(anger_log_params)
    if @anger_log.save_with_tags_and_emotions(tag_names: get_unique_tag_names, emotion_names: get_unique_emotion_names)
      redirect_to anger_logs_path, success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @anger_log = current_user.anger_logs.find(params[:id])
    @anger_log.destroy!
    redirect_to anger_logs_path, success: t('.success'), status: :see_other
  end

  private

  def anger_log_params
    params.require(:anger_log).permit(:occurrence_at, :place, :event, :thought, :anger_level, :review)
  end

  def get_unique_tag_names
    params.dig(:anger_log, :tag_names).split(',').uniq || []
  end

  def get_unique_emotion_names
    params.dig(:anger_log, :emotion_names).split(',').uniq || []
  end
end
