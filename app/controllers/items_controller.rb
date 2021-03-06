class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :show, :edit, :update]
  
  def index
    @items = current_user.items.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'アイテムを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'アイテムの投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'アイテムが正常に修正されました'
      redirect_to @item
    else
      flash.now[:danger] = 'アイテムが修正されませんでした'
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:success] = 'アイテムは正常に削除されました'
    redirect_to items_url
  end
  
  private
  
  def item_params
    params.require(:item).permit(:japanese, :english, :created_at)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
  
end
