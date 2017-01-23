Rails.application.routes.draw do
  
  namespace :admin do
    resources :posts

    root to: "posts#index"
  end

  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/posts', to: 'posts#index'
  resources :posts do
    resources :claims
  end
  
  resources :post_activations, only: [:edit]
  resources :subscriptions, only: [:create, :new, :destroy]
 
end
