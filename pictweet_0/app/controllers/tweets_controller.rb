# アクションが実行されると、自動でそれに対応したビューを表示する
class TweetsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).all.order("created_at DESC").page(params[:page]).per(5)
    # orderを使うときはallを省略することも可能。
    #  created at は、idでも良い。idは登録された順につくから。
  end
  
  def new
  end
  
  # なぜ以下test_paramsは先に定義しなくてもいいのか。
  # privateメソッドって何？あやまって他のファイルから呼び出されるって何？
  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    # if以下の条件設定は、view側でも行なっているが、検証ツール等で編集されてしまう可能性があるため、中でも条件設定する。
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if tweet.user_id == current_user.id
    # tweet_paramsはストロングパラメーター！privateメソッドで定義ずみ！！
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
  
  private
  def tweet_params
    params.permit(:image, :text)
  end
  #createのアクション後はview「create.html.erb」が表示されるが、
  #リソースは「tweets」なので、URLも「/tweets」���ため、更新すると「index」に戻る。。。
  #URLは一緒なのに違う表示がされるのって不思議。。。
  
  def move_to_index
    # ログインしていなかった場合、「index」アクションを実行する
    redirect_to action: :index unless user_signed_in?
  end

end

