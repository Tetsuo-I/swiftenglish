class TestsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @tests = current_user.like_items.order(id: :desc).page(params[:page]).per(1)
  end
end
