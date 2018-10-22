class Admin::HoldersController < ApplicationController

  layout "admin"

  def new
    @holder = Holder.new
  end

  def create
    holder = Holder.new(holder_params)
    holder.save
    redirect_to admin_works_path
  end

  private

  def holder_params
    params.require(:holder).permit(:location, :latitude, :longitude)
  end

end
