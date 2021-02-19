Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id/pets', to: 'shelter_pets#index'
  get '/shelters/:id/pets/new', to: 'shelter_pets#new'
  resources :pets, only: [:index, :show, :edit, :update, :destroy]
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
end
