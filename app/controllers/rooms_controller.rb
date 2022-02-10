class RoomsController < ApplicationController
  before_action :set_room, only: %i[creat]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    unless @room.save
      render new_room_path(@room)
    end
  end

  def show
    @room = Room.find(params[:id])
    respond_to do |format|      
      format.html { }
      format.turbo_stream {  }
    end
  end

  private

    def room_params
      params.require(:room).permit(:name)
    end

    def set_room
      @room = Room.find(params[:id])
    end
end
