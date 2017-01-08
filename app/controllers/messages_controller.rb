class MessagesController < ApplicationController
  def index
    @groups = Group.order(created_at: :desc)
    @group = Group.find(params[:group_id])
    @messages = Message.where(group_id: params[:group_id])
  end
end
