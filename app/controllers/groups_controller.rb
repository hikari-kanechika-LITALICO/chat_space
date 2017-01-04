class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to new_group_path and return
    end
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end
end
