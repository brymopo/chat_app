class MessagesController < ApplicationController  
  before_action :set_room, only: %i[new edit create]
  before_action :set_message, only: %i[edit update show]
  before_action :set_current_user, only: %i[create update]
  
  def new
    @message = @room.messages.new
  end

  def create
    author = current_user.present? ? current_user.username : nil
    @message = @room.messages.create(message_params.merge(author: author))

    if @message.save
      @message = @room.messages.new     
    end
    
    render :new
  end

  def edit
  end

  def show
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

    def set_current_user
      Current.user = current_user
    end
end
