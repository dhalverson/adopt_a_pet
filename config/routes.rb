Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/shelters/:id/pets', to: 'shelter_pets#index'
  get '/shelters/:id/pets/new', to: 'pets#new'
  post '/shelters/:id/pets', to: 'pets#create'
  resources :pets, only: [:index, :show, :edit, :update, :destroy]
  resources :shelters
end
