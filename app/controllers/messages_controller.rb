class MessagesController < ApplicationController
  before_action :group_params
  def index
    @groups = Group.order(created_at: :desc)
    @messages = Message.where(group_id: params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to group_messages_path(@group)
  end

  private
  def group_params
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, group_id: @group.id)
  end
end
