class PlaylistsController < ApplicationController

  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @q = Playlist.ransack(params[:q])
    @playlists = @q.result(distinct: true).paginate(page: params[:page], per_page: 4)
  end

  def new
    @playlist = Playlist.new
  end

  def edit
  end

  def create
    @playlist = Playlist.new(params.require(:playlist).permit(:title, :description, :media_file))
    @playlist.user = current_user
    if @playlist.save
      flash[:notice] = "Playlist was created successfully."
      redirect_to @playlist
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @playlist.update(params.require(:playlist).permit(:title, :description, :media_file))
      flash[:notice] = "Playlist was updated successfully."
      redirect_to @playlist
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def require_same_user
    if current_user != @playlist.user && !current_user.admin?
      flash[:alert] = "You can edit or delete only your own playlist"
      redirect_to @playlist
    end

  end

end
