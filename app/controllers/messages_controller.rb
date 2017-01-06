class MessagesController < ApplicationController
  def index
    @groups = Group.order(created_at: :desc)
    @message = Message.find(params[:group_id])
  end
end
