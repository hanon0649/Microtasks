class FavoritepagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @microtask = current_user.microtasks.build  # form_for 用
      @microtasks = current_user.feed_favorites.order('created_at DESC').page(params[:page])
    end
  end
end
