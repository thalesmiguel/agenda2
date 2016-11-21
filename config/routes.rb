Rails.application.routes.draw do

  root to: "eventos#index"

  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions', registrations: "registrations" }
  resources :usuarios, only: [:index, :destroy]
  devise_scope :usuario do
    get "usuarios/:id/edit" => "registrations#edit", as: 'edit_usuario'
  end

  get 'eventos/update_cidades', as: 'update_cidades'
  resources :eventos

  get 'relatorios/agenda_padrao', to: 'relatorios#agenda_padrao', defaults: {format: 'json'}
  get 'imprimir_agenda', to: 'relatorios#imprimir_agenda', defaults: {format: 'pdf'}

end
