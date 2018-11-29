Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #get 'comments/index'
  #get 'comments/create'

  resources :posts  do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]


  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
