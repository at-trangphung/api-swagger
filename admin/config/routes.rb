Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/dashboard#index'
  scope module: "admin", path: "admin" do
    resources :products, except: :show
    resources :dashboard, only: :index
    resources :categories, except: :show
    resources :users
    resources :orders do
      resources :order_details, only: :index
    end  
    resources :articles
    resources :sizes
    resources :types
    resources :product_options
    resources :comments
    get '/login' => 'sessions#new' 
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
  end
end
