Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :areas, only: [:index, :show] do
    resources :houses, only: [:index, :show]

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  resources :searches, only:[:show]
end
