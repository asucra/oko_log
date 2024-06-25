class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_to_homes_index


  def index; end

  private

  def redirect_to_homes_index
    if user_signed_in?
      redirect_to homes_path, danger: 'ログイン済みです'
    end
  end

end
