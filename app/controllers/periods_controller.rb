class PeriodsController < ApplicationController

  def index
    @periods = Period.search(params[:search])
  end

end
