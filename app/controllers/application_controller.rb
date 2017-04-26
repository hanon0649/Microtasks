class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microtasks = user.microtasks.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    
    #===add_start===
    
    #@count_favoritings = user.favoritings.count
    
    #===add_end===
  end
  
  
end