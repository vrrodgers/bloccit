Rails.application.routes.draw do
  
  

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end
  
   resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
   end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  post 'users/confirm' => 'users#confirm'

  resources :questions
  post 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  resources :advertisements
  
  get 'welcome/contact'
  get 'welcome/faq'
end
 