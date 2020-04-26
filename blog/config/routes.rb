Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
resources :articles do
  resources :comments
end
  
end
