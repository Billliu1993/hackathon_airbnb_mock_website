class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved..."
    else
      render :new, notice: "Something went wrong..."
    end
  end

  def show
    @reviews = @room.reviews
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def update

    if @room.update(room_params)
      flash[:notice] = "Saved..."
    else
      flash[:alter] = "Something went wrong..."
    end
    redirect_back fallback_location: root_path
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def is_ready_room
      !@room.active && !@room.price.blank? && !@room.listing_name.blank? && !@room.photos.blank? && !@room.address.blank?
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bed, :bath_room, :listing_name, :description, :address, :is_wifi, :is_tv, :is_dryer, :is_heating, :is_co, :price, :active)
    end
end
