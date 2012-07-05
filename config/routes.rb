Stasheyboard::Application.routes.draw do
  devise_for :admins


  root :to => "services#index"

  resources :services do
    resources :statuses
  end

end
