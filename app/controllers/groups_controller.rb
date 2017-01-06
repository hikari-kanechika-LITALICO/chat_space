class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def index
    @user = current_user.name
    @groups = Group.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    else
      flash[:alert] = 'グループ名を入力してください。'
      render :new and return
    end
  end

  def edit
    @users = @group.users
  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'チャットグループが更新されました'
      redirect_to :root
    else
      flash[:alert] = 'チャットグループが更新されませんでした'
      render :edit and return
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
