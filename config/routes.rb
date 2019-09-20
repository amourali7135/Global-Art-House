Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :members do
    resources :arts, only: [:new, :create, :edit, :update, :destroy, :show]
    resources :comment, except: [:index]
    resources :reactions, only: [:index, :new, :create]
  end
  resources :arts, only: [:index, :show] do
    resources :comment, except: [:index] #works?
    resources :reactions, only: [:index, :new, :create] #works?
  end
  resources :follows, only: [:create, :destroy] #nested?
  resources :reactions, only: [:new, :create]
  resources :location, only: [:index, :new, :create, :show]
  resources :descriptive_tags, only: [:index, :new, :create, :show]
  resources :reaction_list, only: [:new, :create] #need or DB?
  resources :cart_products, only: [:destroy]
  resources :shopping_carts, only: [:show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]
  end

  # resources :users, except: [:new, :create] why?


  get 'about', to: 'pages#about', as: 'about'
  get 'explore', to: 'pages#explore', as: 'explore'
  get "help", to: "pages#help", as: 'help'
  get 'contact', to: 'pages#contact', as: 'contact'
end
