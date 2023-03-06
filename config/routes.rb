Rails.application.routes.draw do
  defaults format: :json do
    resources :contents, only: :index
    resources :movies, only: :index
    resources :seasons, only: :index

    resources :users do
      member do
        get :library
        post :purchase
      end
    end
  end
end
