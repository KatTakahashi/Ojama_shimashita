Rails.application.routes.draw do
  # 会員用
  # URL /members/sign_in ...
  devise_for :members, controllers: {
    registrations: "public/registrations",
    passwords: "public/passwords",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
