class VisitsController < ApplicationController

  def index
    @visits = Visit.where(user_id: current_user.id)
    # @visit = @visits.find_by(work_id: params[:work_id])
    @holders = @visits.select("work_id").distinct.order("work_id")


    # @works = []
    # @visits.each do |visit|
    #    @works.push(visit.work)
    # end
    # @visitW = @visit.works
    # @holders = @visitW.holders.uniq
    @works = Work.where(holder_id: @holders).all
  end

  # add to my visit list
  def add_visit
    work = Work.find(params[:id])
    visit = current_user.visits.new(work_id: work.id)
    if visit.save
    redirect_to gallery_path(work)
    else
      render 'work#show'
    end
  end

  # galleryページからの削除
  def destroy
    work = Work.find(params[:work_id])
    visit = current_user.visits.find_by(visit_id: params[:visit_id])
    visit.destroy
    redirect_to gallery_path(work)
  end

  # galleryページからの削除
  def withdraw
    work = Work.find(params[:work_id])
    visit = current_user.visits.find_by(visit_id: params[:visit_id])
    visit.destroy
    redirect_to my_gallery_path(work)
  end



end
