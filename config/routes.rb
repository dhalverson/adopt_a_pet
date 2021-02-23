Rails.application.routes.draw do
  get '/shelters/:id/pets', to: 'shelter_pets#index'
  resources :pets, :shelters
end
