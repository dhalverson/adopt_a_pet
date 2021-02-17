Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id/pets', to: 'shelter_pets#index'
  resources :pets, only: [:index, :show]
end
