class VisitsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user.id
    @visits = Visit.where(user_id: current_user.id)
  end

  # add to my visit list from gallery#show
  def add_visit
    work = Work.find(params[:id])
    visit = current_user.visits.new(work_id: work.id)
    if visit.save
    redirect_to user_visits_path
    else
      render 'work#show'
    end
  end
  # add to my visit list from my_gallery#show
  def pin_map
    my_gallery = MyGallery.find(params[:id])
    work = my_gallery.work
    visit = current_user.visits.new(work_id: work.id)
    if visit.save
    redirect_to user_visits_path
    else
      render 'my_galleries#show'
    end
  end

  # visited_at
  def update
    visit = current_user.visits.find(params[:id])
    work = visit.work_id
    visit.update(visit_params)
    redirect_to user_visits_path
  end

  # # galleryページからの削除
  # def destroy
  #   visit = current_user.visits.find(params[:id])
  #   work = visit.work_id
  #   visit.destroy
  #   redirect_to gallery_path(work)
  # end

  # galleryページからの削除
  def withdraw
    visit = current_user.visits.find_by(id: params[:id])
    visit.destroy
    redirect_to user_visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(:visited_at, :work_id, :user_id)
  end

  def correct_user
    @visits = current_user.visits
    unless @user == current_user.id
      redirect_to gallery_index_path
    end
  end

end
