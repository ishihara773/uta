Rails.application.routes.draw do
  #get 'users/index'
  #get 'users/show'
  devise_for :users
  # 追加：PLAYページ
  get "/play", to: "homes#play"

  # 追加：新規登録/ログインへ分岐するTOP（今までのtop）
  #get "/top", to: "homes#top"   # ← 今の top を /top として使う
  get "/top", to: "homes#top", as: :top
  # root を PLAY にする
  root to: "homes#play"

  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  #get 'posts/new'
  #post 'posts' => 'posts#create'
  #resources :posts #まとめてやってくれる 下に変更　ポストをコメントにくっつける
  #いいねもくっつける感じ　ポスト：Nの関係
  resources :posts do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
    collection do
      get 'confirm'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  #get 'top' => 'homes#top'
 # root :to => 'homes#top'   #この行を記述

end
