class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する→tweetsのshowアクション
  end
  
  private
  # 定義しているだけで実行はしていないから、上のメソッドの後に書いてても大丈夫やねん
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
