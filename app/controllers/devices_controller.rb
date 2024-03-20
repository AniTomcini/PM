class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show
  end

  def index
    @q = Device.ransack(params[:q])
    @devices = @q.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(params.require(:device).permit(:name, :playlist_id))
    @device.user = current_user
    if @device.save
      flash[:notice] = "Device was created successfully."
      redirect_to @device
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update
    if @device.update(params.require(:device).permit(:name, :playlist_id))
      flash[:notice] = "Device was updated successfully."
      redirect_to @device
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_path
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def require_same_user
    if current_user != @device.user && !current_user.admin?
      flash[:alert] = "You can edit or delete only your own device"
      redirect_to @device
    end

  end

end
