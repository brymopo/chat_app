class MessagesController < ApplicationController
  before_action :set_room, only: %i[new create]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create(message_params)

    if @message.save
      @message = @room.messages.new
    end
    render :new
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:content, :author)
    end
end
