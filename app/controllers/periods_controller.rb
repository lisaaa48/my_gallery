class PeriodsController < ApplicationController

  def index
    @works = Work.search(params[:search])
  end

end
