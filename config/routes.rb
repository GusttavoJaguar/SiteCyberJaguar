Rails.application.routes.draw do
  # Rota para servir sua página HTML principal
  root to: 'pages#index'
  
  # API para contatos
  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:create]
    end
  end
  

  get '/health', to: 'health#index'

  # Rota fallback para Single Page Application
  get '*path', to: 'pages#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end
end