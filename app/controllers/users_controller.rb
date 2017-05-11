class UsersController < ApplicationController
  def search
    @users = User.where("name like ?", "%#{search_params[:q]}%").order('name ASC')
    respond_to do |format|
      format.json { render json: @users}
    end
  end

  private
  def search_params
    params.permit(:q)
  end
end
