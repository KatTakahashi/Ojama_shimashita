Rails.application.routes.draw do

  # 管理者用(URLに/admin/を付与する為、namespace)
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :members, only: [:index, :update]
    resources :categories, only: [:new, :create]
  end


  # 会員用(URLに/public/不要な為、scope module)
  devise_for :members, controllers: {
  registrations: 'public/registrations',
  passwords: 'public/passwords',
  sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :members, only: [:show, :edit, :update]
      get 'members/confirm' => 'members#confirm'
      patch 'members/withdraw' => 'members#withdraw'
      get 'members/follows' => 'members#follows'
      get 'members/followers' => 'members#followers'
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
      get 'posts/index_pref' => 'posts#index_pref'
      get 'posts/index_all' => 'posts#index_all'
      get 'posts/index_pref_all' => 'posts#index_pref_all'
    resources :post_likes, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    resources :contacts, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
