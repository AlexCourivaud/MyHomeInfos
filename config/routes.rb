Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
    resources :rooms do
      resources :items
      member do
        patch :update
      end
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
