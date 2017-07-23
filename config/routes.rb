Rails.application.routes.draw do
  
  get 'likes/index'

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:index, :create, :destroy]
  end
  
  resources :topics do
    resources :bookmarks
  end
  
  devise_for :users
  
  get 'welcome/index'

  get 'welcome/about'
  
  root 'welcome#index'
  
  resources :users, only: [:new, :index, :show]
  
  post :incoming, to: 'incoming#create'

end
