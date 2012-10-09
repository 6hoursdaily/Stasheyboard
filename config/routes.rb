Stasheyboard::Application.routes.draw do
  get "statuses/index"

  get "statuses/show"

  get "statuses/create"

  match "crazymonkey"  => "devise/sessions#new"

  devise_for :admins


  root :to => "services#index"

  resources :services do
    resources :statuses
  end

end
