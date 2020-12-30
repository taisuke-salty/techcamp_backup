class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    #@tweets = Tweet.where(user_id: current_user.id)
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end
end