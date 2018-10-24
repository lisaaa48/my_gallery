class VisitsController < ApplicationController

  before_action :authenticate_user!
  # before_action :correct_user, only: [:index, :add_visit, :update, :destroy, :withdraw]

  def index
    @visits = Visit.where(user_id: current_user.id)
    @user = current_user.id
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

  # visited_at
  def update
    work = Work.find(params[:id])
    visit = current_user.visits.find_by(work_id: work.id)
    visit.update(visit_params)
    redirect_to user_visits_path
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
