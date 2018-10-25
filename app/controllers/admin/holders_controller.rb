class Admin::HoldersController < ApplicationController

  before_action :authenticate_user!

  layout "admin"

  def new
    @holder = Holder.new
    @holders = Holder.all.order(id: "DESC")
  end

  def create
    holder = Holder.new(holder_params)
    holder.save
    redirect_to new_admin_holder_path
    # redirect_to admin_works_path
  end

  private

  def holder_params
    params.require(:holder).permit(:location, :latitude, :longitude)
  end

end
