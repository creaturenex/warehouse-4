Rails.application.routes.draw do
  resources :locations
  resources :inventory do
    resources :items
  end
  root 'locations#index'
end
