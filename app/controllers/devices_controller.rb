class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @devices = Device.all
    respond_with(@devices)
  end

  def show
    respond_with(@device)
  end

  def new
    @device = current_user.devices.build
    respond_with(@device)
  end

  def edit
  end

  def create
    @device = current_user.devices.build(device_params)
    @device.save
    respond_with(@device)
  end

  def update
    @device.update(device_params)
    respond_with(@device)
  end

  def destroy
    @device.destroy
    respond_with(@device)
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def correct_user
      @device = current_user.devices.find_by(id: params[:id])
      redirect_to devices_path, notice: "Not authorized" if @device.nil?
    end

    def device_params
      params.require(:device).permit(:name, :owner)
    end
end
