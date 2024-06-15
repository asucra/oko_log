class AngerLogsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @anger_log = AngerLog.new
  end

  def create
  end
end
