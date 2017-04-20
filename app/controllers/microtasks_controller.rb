class MicrotasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @microtask = current_user.microtasks.build(microtask_params)
    if @microtask.save
      flash[:success] = 'タスクを投稿しました。'
      redirect_to root_url
    else
      @microtasks = current_user.microtasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'タスクの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @microtask.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def microtask_params
    params.require(:microtask).permit(:content)
  end
  
  def correct_user
    @microtask = current_user.microtasks.find_by(id: params[:id])
    unless @microtask
      redirect_to root_path
    end
  end
  
  
end
