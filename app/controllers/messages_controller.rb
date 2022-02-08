class MessagesController < ApplicationController
  before_action :set_room, only: %i[new edit create]
  before_action :set_message, only: %i[edit update]

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

  def edit
  end

  def update
    unless @message.update(message_params)
      render :edit
    end
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :author)
    end
end
