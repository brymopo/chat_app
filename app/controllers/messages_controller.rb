class MessagesController < ApplicationController
  before_action :set_room

  def new
    @message = @room.messages.new
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end
end
