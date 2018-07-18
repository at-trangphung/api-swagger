Rails.application.routes.draw do

  root 'shop#index'
  
  get '/search' => 'shop#search'
  post '/search' => 'shop#search'
  resources :shop, only: [:index, :create, :show]
  
  scope module: 'shop' do
    get 'thanks_for_order/index'
    get 'terms_conditions/index'
    get '/thanks_for_order' => 'thanks_for_order#index'

    resources :products do 
      resources :comments_product
    end
    resources :category
    resources :products, only: [:show, :update]
    resources :carts, except: %i(new edit)
    resources :checkout

    resources :transactions, controller: :checkout
    resources :terms_conditions, only: [:index]
    resources :favorites, only: [:create, :destroy]
  end

  scope module: 'article' do
    resources :articles do 
      resources :comments
    end
  end

  scope module: 'user' do
    get '/login' => 'sessions#new' 
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy' 
    get 'sign_up' => 'users#new'
    post 'sign_up' => 'users#create'
    get 'password_resets/new'
    get 'password_resets/show'

    resources :sessions, only: [:create, :destroy]
    resources :users, except: :index
    resources :account_activations, only: :edit
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :customers
    resources :my_comments
  end
end

