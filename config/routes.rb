Stasheyboard::Application.routes.draw do
  get "statuses/index"

  get "statuses/show"

  get "statuses/create"


  namespace :admin do
    devise_for :admins do
      get '', to: 'dashboard#index', as: '/'
      match "crazymonkey"  => "devise/sessions#new"
    end
  end
  
  root :to => "services#index"

  resources :services do
    resources :statuses
  end

end
