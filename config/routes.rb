Rails.application.routes.draw do
  root 'posts#index'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  resources :posts
  resources :post_activations, only: [:edit]
 
end
