Rails.application.routes.draw do
  # ？？要確認！　HTMLメソッドはURLでリソースが読まれるときに、
  # 同時に、そのリンクのメソッドプロパティで指定される。
  # ただし、getはデフォなので、指定がなければget.
  devise_for :users
  root 'tweets#index' 
  # 以下、resourecesメソッドを使う前に、tweets, usersに関する理解のために一つ一つ作った。
  # get  'tweets'     => 'tweets#index'
  # get  'tweets/new' => 'tweets#new' 
  # post 'tweets'     => 'tweets#create'
  # get  'users/:id'  =>  'users#show'    #Mypageへのルーティング
  # delete 'tweets/:id'  =>  'tweets#destroy'
  # get  'tweets/:id/edit'  =>  'tweets#edit'
  # patch   'tweets/:id'  => 'tweets#update'
  # get  'tweets/:id'  =>  'tweets#show'  #ツイート詳細画面
  resources :tweets do                     #tweets_controllerに対してのresourcesメソッド
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド


end

