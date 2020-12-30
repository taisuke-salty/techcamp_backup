class TweetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    #５ページごと表示ならば何ページになるのかを計算して、その値もふくんだインスタンスを取ってきて
    #@tweets変数に格納している。→ビューファイルがそれに応じて表示させる。
  end

  def new
  end

  def create
    Tweet.create(
      image: tweet_params[:image],
      text: tweet_params[:text],
      user_id: current_user.id,
      )
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
  
  def work
    @tweet = Tweet.find(1)
    @tweets2 = Tweet.all
  end

  private
  def tweet_params
    params.permit( :image, :text, )
  end

  def move_to_index
    # ログインしていなかった場合、「index」アクションを実行する
    redirect_to action: :index unless user_signed_in?
  end
end
