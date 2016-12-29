class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to root_path
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end
end

