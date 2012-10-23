Stasheyboard::Application.routes.draw do

  get "statuses/index"

  get "statuses/show"

  get "statuses/create"


  # got rid of registerable; gonna have to add a admin user controller I think
  devise_for :admins do
    get '/devise/sessions/new', to: 'devise/sessions#new', as: '/polkadotmonkey'
  end


  namespace :admin do
    get '', to: 'dashboard#index', as: '/dashboard'
  end
 

  root :to => "application#admin_sign_in_redirect"

  resources :services do
    resources :statuses
  end

end
