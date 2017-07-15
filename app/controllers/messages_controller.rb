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
      respond_to do |format|
        format.json { render json: {
          text: @message.text,
          image: @message.image.url,
          created_at: @message.created_at,
          name: @message.user.name }}
        flash[:notice] = 'メッセージ送信できました'
      end
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
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end
end


  # def create
  #   @message = @group.messages.new(message_params)
  #   if @message.save
  #     respond_to do |format|
  #       # format.json { render json: {
  #       #    text: @message.text,
  #       #    image: @message.image.url,
  #       #    created_at: @message.created_at,
  #       #    name: @message.user.name }}
  #       format.json { render json: @message }
  #       flash[:notice] = 'メッセージ送信できました'
  #     end
  #   else
  #     flash[:alert] = 'メッセージを入力してください'
  #     render :index
  #   end
  #   # if @message.save
  #   #   flash[:notice] = 'メッセージ送信できました'
  #   #   respond_to do |format|
  #   #     format.json { render json: {
  #   #        text: @message.text,
  #   #        image: @message.image.url,
  #   #        created_at: @message.created_at,
  #   #        name: @message.user.name }}
  #   #   end
  #   # else
  #   #   flash[:alert] = 'メッセージを入力してください'
  #   #   render :index
  #   # end
  # end
