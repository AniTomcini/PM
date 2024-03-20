class VideosController < ApplicationController

  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true).paginate(page: params[:page], per_page: 3)
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      flash[:notice] = "Video was created successfully."
      redirect_to @video
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @video.update(video_params)
      flash[:notice] = "Video was updated successfully."
      redirect_to @video
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :link, :media_file, :playlist_id)
  end

  def require_same_user
    if current_user != @video.user && !current_user.admin?
      flash[:alert] = "You can edit or delete only your own media"
      redirect_to @video
    end

  end

end
