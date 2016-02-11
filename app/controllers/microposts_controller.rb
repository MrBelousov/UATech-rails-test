class MicropostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    respond_to do |format|
      if @micropost.save
        flash[:success] = "Micropost created!"
        format.html { redirect_to user_path(current_user) }
        format.js
      else
        format.html { redirect_to user_path(current_user) }
      end
    end
  end

  def destroy
    @micropost.destroy
    redirect_to user_path(current_user)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:micropost_text)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
