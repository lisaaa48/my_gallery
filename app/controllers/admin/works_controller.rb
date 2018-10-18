class Admin::WorksController < ApplicationController

  def index
    @works =Work.all
  end

  def new
    @work = Work.new
  end

  # 後々バリデーションかける
  def create
    work = Work.new(work_params)
    work.save
    redirect_to admin_works_path
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update!(work_params)
    redirect_to admin_works_path
  end


  private

  def work_params
    params.require(:work).permit(:img, :title, :author, :period_id, :production_year, :tool, :width, :height, :period_id, :holder_id)
  end

end
