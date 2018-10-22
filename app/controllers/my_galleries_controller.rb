class MyGalleriesController < ApplicationController

  def index
    @user = current_user
    @works = MyGallery.where(user_id: current_user.id)
  end

  def show
    @user = current_user
    @my_galleries = @user.my_galleries
    @my_gallery = @my_galleries.find(params[:id])
  end

  def edit
    @my_gallery = MyGallery.find(params[:id])
  end

  def update
    user = current_user
    my_galleries = user.my_galleries
    my_gallery = MyGallery.find(params[:id])
    my_gallery = my_galleries.find(params[:id])
    if my_gallery.update(my_gallery_params)
      redirect_to user_my_gallery_path(my_gallery)
    else
      render 'My_galleris/edit'
    end
  end

  # add to my gallery
  def add_gallery
    work = Work.find(params[:id])
    my_gallery = current_user.my_galleries.new(work_id: work.id)
    if my_gallery.save
    redirect_to gallery_path(work)
    else
      render 'work#show'
    end
  end

  # galleryページからの削除
  def destroy
    work = Work.find(params[:work_id])
    my_gallery = current_user.my_galleries.find_by(my_gallery_id: params[:my_gallery_id])
    my_gallery.destroy
    redirect_to gallery_path(work)
  end

  # my_galleryページからの削除
  def withdraw
    work = Work.find(params[:work_id])
    my_gallery = current_user.my_galleries.find_by(my_gallery_id: params[:my_gallery_id])
    my_gallery.destroy
    redirect_to my_gallery_path(work)
  end

  private

  def my_gallery_params
   params.require(:my_gallery).permit(:description, :tag_list, :work_id, :user_id, :name)
  end

end
