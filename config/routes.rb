Stasheyboard::Application.routes.draw do
  get "statuses/index"

  get "statuses/show"

  get "statuses/create"


  devise_for :admins do
    match "crazymonkey"  => "devise/sessions#new"
  end
  root :to => "services#index"

  resources :services do
    resources :statuses
  end

end
