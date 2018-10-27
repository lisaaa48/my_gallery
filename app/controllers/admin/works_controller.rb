class Admin::WorksController < ApplicationController

  before_action :authenticate_admin!

  layout "admin"

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
    params[:pin].values.each do |i|
      pin = Pin.create(work_id: work.id, note: i.values[0], value_x: i.values[1], value_y: i.values[2])
    end
    redirect_to admin_works_path
  end

  def edit
    @work = Work.find(params[:id])
    @pins = @work.pins
  end

  def update
    work = Work.find(params[:id])
    pins = work.pins
    work.update(work_params)
    pins.each do |pin|
      pin.note.update(pin_params)
    end
    redirect_to admin_works_path
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
    redirect_to admin_works_path
  end


  private

  def work_params
    params.require(:work).permit(:img, :title, :author, :period_id, :production_year, :tool, :width, :height, :period_id, :holder_id)
  end

  def pin_params
    params.require(:pin).permit(:work_id, :note, :value_x, :value_y)
  end

end
