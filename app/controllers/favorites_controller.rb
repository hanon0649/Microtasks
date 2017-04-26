class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @favorites = Favorite.all.page(params[:page])
  end

  def create
    microtask = Microtask.find(params[:microtask_id])
    current_user.favorite(microtask)
    flash[:success] = 'タスクをお気に入りしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    microtask = Microtask.find(params[:microtask_id])
    current_user.unfavorite(microtask)
    flash[:success] = 'タスクのお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
