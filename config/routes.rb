Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shelters
  resources :pets, only: [:index, :show, :edit, :update, :destroy]
  get '/shelters/:id/pets', to: 'shelter_pets#index'
end
