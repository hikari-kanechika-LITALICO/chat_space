class GroupsController < ApplicationController
  def index
    @user = current_user.name
    @groups = Group.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    else
      flash[:alert] = 'グループ名を入力してください。'
      render :new and return
    end
  end

  def edit
    set_group
    @users = @group.users
  end

  def update
    set_group
    @group.update(update_params)
    redirect_to :root
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def create_params
    params.require(:group).permit(:name)
  end

  def update_params
    params.require(:group).permit(:name)
  end
end
