Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :areas, only: [:show] do
    resources :houses, only: [:index, :show] do
      get 'contact'
    end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  resources :searches, only:[:show, :index, :new, :create, :update]
  #resources :search, only: [:index]
end
