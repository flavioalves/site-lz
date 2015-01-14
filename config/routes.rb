SiteLZ::Application.routes.draw do
  devise_for :users
  
  get '/usuarios/minha-conta' => 'settings#edit', as: :edit_user
  put '/usuarios' => 'settings#update', as: :update_user
  
  root  to:                     'home#index'
  get 'contato'              => 'contacts#index', as: :contacts
  get 'contato/enviar'       => 'contacts#new',   as: :new_contact

  get 'frontend/:template'   => 'frontend#show'
  get 'frontend'             => 'frontend#index'

  get 'projetos'                         => 'projects#index'
  get 'projetos/:category/:name'         => 'projects#show'
  get 'clientes/:name'                   => 'clients#index'
  
  get ':slug'                            => 'pages#show',     as: :page
end
