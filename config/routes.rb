Rails.application.routes.draw do
  
  resources :bookmarks, except: [:index]

  resources :topics do
    resources :bookmarks
  end
  
  devise_for :users
  
  get 'welcome/index'

  get 'welcome/about'
  
  root 'welcome#index'
  
  resources :users
  
  post :incoming, to: 'incoming#create'

end
