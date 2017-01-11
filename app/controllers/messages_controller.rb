class MessagesController < ApplicationController
  before_action :group_params
  def index
    @groups = Group.order(created_at: :desc)
    @messages = @group.messages
    @message = Message.new
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      flash[:notice] = 'メッセージ送信できました'
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def group_params
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end
end
