Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/edit'
  # get 'locations/index'
  # get 'locations/new'
  # get 'locations/create'
  # get 'locations/show'
  # get 'locations/update'
  # get 'locations/destroy'
  # get 'locations/edit'
  # get 'messages/index'
  # get 'messages/new'
  # get 'messages/create'
  # get 'messages/show'
  # get 'messages/update'
  # get 'messages/destroy'
  # get 'messages/edit'
  # get 'descriptive_tags/index'
  # get 'descriptive_tags/new'
  # get 'descriptive_tags/create'
  # get 'descriptive_tags/show'
  # get 'descriptive_tags/update'
  # get 'descriptive_tags/destroy'
  # get 'descriptive_tags/edit'
  # get 'reactions/index'
  # get 'reactions/new'
  # get 'reactions/create'
  # get 'reactions/show'
  # get 'reactions/update'
  # get 'reactions/destroy'
  # get 'reactions/edit'
  # get 'payments/index'
  # get 'payments/new'
  # get 'payments/create'
  # get 'payments/show'
  # get 'payments/update'
  # get 'payments/destroy'
  # get 'payments/edit'
  # get 'orders/index'
  # get 'orders/new'
  # get 'orders/create'
  # get 'orders/show'
  # get 'orders/update'
  # get 'orders/destroy'
  # get 'orders/edit'
  # get 'shopping_carts/index'
  # get 'shopping_carts/new'
  # get 'shopping_carts/create'
  # get 'shopping_carts/show'
  # get 'shopping_carts/update'
  # get 'shopping_carts/destroy'
  # get 'shopping_carts/edit'
  # get 'follows/index'
  # get 'follows/new'
  # get 'follows/create'
  # get 'follows/show'
  # get 'follows/update'
  # get 'follows/destroy'
  # get 'follows/edit'
  # get 'comments/index'
  # get 'comments/new'
  # get 'comments/create'
  # get 'comments/show'
  # get 'comments/update'
  # get 'comments/destroy'
  # get 'comments/edit'
  # get 'arts/index'
  # get 'arts/new'
  # get 'arts/create'
  # get 'arts/show'
  # get 'arts/update'
  # get 'arts/destroy'
  # get 'arts/edit'
  # get 'members/index'
  # get 'members/new'
  # get 'members/create'
  # get 'members/show'
  # get 'members/update'
  # get 'members/destroy'
  # get 'members/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :members do
    resources :arts, only: [:index, :new, :create]
    # resources :comment, except: [:index]
    # resources :reactions, only: [:index, :new, :create]
  end
  resources :arts,  only: [:show, :edit, :update, :destroy] do
    resources :comment #, except: [:index] #works?
    # resources :reactions, only: [:index, :new, :create, :destroy] #works?
    resources :likes, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy] #nested?

  # resources :descriptive_tags, only: [:index, :show] can use search isntead
  resources :locations, only: [:index, :show]

  resources :cart_products, only: [:destroy]
  resources :shopping_carts, only: [:show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:show] do
    resources :payments, only: [:new, :create]
  end
  # resources :users, except: [:new, :create] why?
  # resources :reaction_list, only: [:new, :create] #need or DB?
  # resources :reactions, only: [:new, :create] DB?
  # resources :location, only: [:index, :new, :create, :show]

  get 'about', to: 'pages#about', as: 'about'
  get 'explore', to: 'pages#explore', as: 'explore'
  get "help", to: "pages#help", as: 'help'
  get 'contact', to: 'pages#contact', as: 'contact'
end
