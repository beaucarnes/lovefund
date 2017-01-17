Rails.application.routes.draw do
  
  namespace :admin do
    resources :posts

    root to: "posts#index"
  end

  root 'posts#index'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/home', to: 'static_pages#home'
  resources :posts do
    resources :claims
  end
  
  resources :post_activations, only: [:edit]
 
end
