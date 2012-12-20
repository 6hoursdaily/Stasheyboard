Stasheyboard::Application.routes.draw do


  # change to scope_for?  
  devise_for :admins do
    get '/devise/sessions/new', to: 'devise/sessions#new'
  end


  namespace :admin do
    get '', to: 'dashboard#index', as: '/dashboard'
    resources :admins
  end
 

  root :to => "application#admin_sign_in_redirect"

  resources :services do
    get :feed, on: :member
    resources :statuses
  end

end
