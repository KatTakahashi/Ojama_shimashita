Rails.application.routes.draw do

# =============== 管理者用(URLに/admin/を付与する為、namespace) ===============
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    resources :members, only: [:index, :edit, :update, :destroy]
  end

# =============== 会員用(URLに/public/不要な為、scope module) ===============
  devise_for :members, controllers: {
  registrations: 'public/registrations',
  passwords: 'public/passwords',
  sessions: 'public/sessions'
  }

  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#new_guest'
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :members, only: [:show, :edit, :update, :destroy] do
      member do
        get 'follows' => 'members#follows'
        get 'followers' => 'members#followers'
        get 'post_index'
        get 'post_index_pref'
      end
      collection do
        get 'confirm' => 'members#confirm'
      end
    end
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      collection do
        get 'index_pref'
        get 'search'
      end
      resources :post_comments, only: [:create, :destroy]
      resource :post_likes, only: [:create, :destroy]
    end
    post 'follows/:id' => 'relationships#follow', as: 'follows'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    resources :contacts, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
