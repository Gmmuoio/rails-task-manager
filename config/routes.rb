Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tasks do
    collection do
      get 'edit_multiple'
      patch 'update_multiple'
    end
  end
end
