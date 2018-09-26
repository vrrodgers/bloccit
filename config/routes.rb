Rails.application.routes.draw do
  
  

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end

  resources :questions
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
  resources :advertisements
  
  get 'welcome/contact'
  get 'welcome/faq'
end
