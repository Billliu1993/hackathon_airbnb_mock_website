class PagesController < ApplicationController
  def home
    @rooms = Room.limit(3)
  end

  def search
    @rooms_address = Room.all
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result.page(params[:page])
    @arrRooms = @rooms.to_a
  end
end
