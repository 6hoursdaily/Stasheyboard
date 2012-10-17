Stasheyboard::Application.routes.draw do

  get "statuses/index"

  get "statuses/show"

  get "statuses/create"

  devise_for :admins 

  namespace :admin do
    get '', to: 'dashboard#index', as: '/dashboard'
  end
  
  root :to => "services#index"

  resources :services do
    resources :statuses
  end

end
