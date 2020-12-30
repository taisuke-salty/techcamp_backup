class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @articles = Article.all.includes(:user)
  end
  
  def new
  end
  
  def create
    Article.create(text: params_article[:text], user_id: current_user.id)
  end
  
  def edit
    @article = Article.find(params[:id])
    # binding.pry
    # binding.pry
  end
  
  def destroy
    # binding.pry
    article = Article.find(params[:id])
    article.destroy if current_user.id == article.user.id
  end
  
  def update
    article = Article.find(params[:id])
    article.update(params_article) if current_user.id == article.user_id
    # binding.pry
  end
  
  private
  def params_article
    params.permit(:text)
  end  
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
