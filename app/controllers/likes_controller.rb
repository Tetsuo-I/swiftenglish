class LikesController < ApplicationController
  before_action :require_user_logged_in
  def create
    item = Item.find(params[:item_id])
    current_user.like(item)
    flash[:success] = 'いいねしました！'
    redirect_to root_path
  end

  def destroy
    item = Item.find(params[:item_id])
    current_user.unlike(item)
    flash[:success] = 'いいねを解除しました。'
    redirect_to root_path
  end
end
