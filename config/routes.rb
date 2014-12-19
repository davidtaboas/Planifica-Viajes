Rails.application.routes.draw do



  root 'home#index'

  # páginas
  scope "(:locale)", locale: /es/ do
    get '/funcionalidades' => 'pages#features'
    get '/contacto' => 'pages#contact'
    get '/teayudamos' => 'pages#help'
  end

  # devise_for :users
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'new' }

  # perfil usuarios

  resources :profiles, :path => "u"

  resources :profiles do
    resources :trips
  end


  # páginas viaje

  resources :trips, :path => "t"




  # API

  namespace :api do
    resources :trips do
        resources :items
        resources :places
        resources :budgets
        resources :users
        resource :image
    end
  end

  # ERRORES

  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

end
