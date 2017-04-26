# class FavorelationshipsController < ApplicationController
#   before_action :require_user_logged_in

#   def create
#     microtask = Microtask.find(params[:microtask_id])
#     current_user.favorite(microtask)
#     flash[:success] = 'タスクをお気に入りしました。'
#     redirect_to microtask
#   end

#   def destroy
#     microtask = Microtask.find(params[:microtask_id])
#     current_user.unfavorite(microtask)
#     flash[:success] = 'タスクのお気に入りを解除しました。'
#     redirect_to microtask
#   end
# end
