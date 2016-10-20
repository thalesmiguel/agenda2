Rails.application.routes.draw do

  devise_for :usuarios
  root to: "eventos#index"

  get 'eventos/update_cidades', as: 'update_cidades'
  resources :eventos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
