class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @microtask = current_user.microtasks.build  # form_for 用
      @microtasks = current_user.microtasks.order('created_at DESC').page(params[:page])
    end
  end
end