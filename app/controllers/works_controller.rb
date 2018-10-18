class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
    @holder = @work.holder
  end

end
