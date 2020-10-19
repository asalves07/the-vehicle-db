Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :manufacturers do 
     resource :vehicles, only: [:show]
     resource :vehicles, only: [:show], path:'relationships/manufacturer'
  end

  resources :vehicles do
    resource :manufacturer, only: [:show]
    resource :manufacturer, only: [:show], path:'relationships/manufacturer'

    resource :sale, only: [:show]
    resource :sale, only: [:show], path:'relationships/manufacturer'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
