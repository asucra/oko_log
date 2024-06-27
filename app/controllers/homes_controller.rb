class HomesController < ApplicationController
  def index
    to = Time.current.end_of_day
    from = (to - 6.day).at_beginning_of_day
    @anger_logs = current_user.anger_logs.includes(:tags, :emotions).where(occurrence_at: from...to).order(occurrence_at: :desc)
  end
end
